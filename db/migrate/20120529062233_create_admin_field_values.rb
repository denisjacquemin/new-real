class CreateAdminFieldValues < ActiveRecord::Migration
  def change
    create_table :admin_field_values do |t|
      t.string :value
      t.integer :item_id
      t.integer :field_id

      t.timestamps
    end
  end
end
