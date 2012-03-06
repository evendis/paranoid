module Paranoid
  module ParanoidMethods
    extend ActiveSupport::Concern

    included do
      extend ClassMethods
      alias_method_chain :create_or_update, :paranoid
    end

    module ClassMethods
      # Returns the condition used to scope the return to exclude
      # soft deleted records
      def paranoid_condition
        {destroyed_field => field_not_destroyed}
      end

      # Returns the condition used to scope the return to contain
      # only soft deleted records
      def paranoid_only_condition
        val = field_not_destroyed.respond_to?(:call) ? field_not_destroyed.call : field_not_destroyed
        column_sql = self.sanitize_sql_for_assignment(destroyed_field)
        case val
        when nil then "#{column_sql} IS NOT NULL"
        else          ["#{column_sql} != ?", val]
        end
      end

      # Temporarily disables paranoid on the model
      def disable_paranoid
        if block_given?
          @paranoid = false
          yield
        else
          raise 'Only block form is supported'
        end
      ensure
        @paranoid = true
      end
    end

    # Restores the record
    def restore
      set_destroyed(field_not_destroyed.respond_to?(:call) ? field_not_destroyed.call : field_not_destroyed)
      
      self.class.reflect_on_all_associations.each do |association|
        if association.options[:dependent] == :destroy && association.klass.paranoid?
          restore_related(association.klass, association.foreign_key, association.options[:primary_key] || 'id', association.options) if association.macro.to_s =~ /^has/
        end
      end
      
      @destroyed = false
      self
    end

    # Override the default destroy to allow us to soft delete records.
    # This preserves the before_destroy and after_destroy callbacks.
    # Because this is also called internally by Model.destroy_all and
    # the Model.destroy(id), we don't need to specify those methods
    # separately.
    def destroy
      _run_destroy_callbacks do
        set_destroyed(field_destroyed.respond_to?(:call) ? field_destroyed.call : field_destroyed)
        @destroyed = true
      end

      self
    end

    protected

    # Overrides ActiveRecord::Base#create_or_update
    # to disable paranoid during the create and update operations
    def create_or_update_with_paranoid
      self.class.disable_paranoid { create_or_update_without_paranoid }
    end

    # Set the value for the destroyed field.
    # paranoid <=0.0.9 got stomped on by ar 3.0.3/arel 2.0.6 (arel team are attempting to deprecate 'update')
    # This change probably makes backward compatibility an issue
    def set_destroyed(val)
      self[destroyed_field] = val
      updates = Arel::Nodes::SqlLiteral.new(self.class.send(:sanitize_sql_for_assignment, {destroyed_field => val}))
      self.class.unscoped.with_destroyed.where(self.class.arel_table[self.class.primary_key].eq(id)).arel.update(updates)
      @destroyed = true
    end
    
    # Restores related records
    def restore_related(klass, key_name, id_name, options)
      klass.unscoped.with_destroyed_only.where(klass.arel_table[key_name].eq(send(id_name))).each do |model|
        model.restore
      end
    end
  end
end