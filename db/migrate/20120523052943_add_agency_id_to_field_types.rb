class AddAgencyIdToFieldTypes < ActiveRecord::Migration
  def change
    add_column :admin_field_types, :agency_id, :integer
  end
end
