class AddFieldTypeIdToAdminFields < ActiveRecord::Migration
  def change
    add_column :admin_fields, :field_type_id, :integer
  end
end
