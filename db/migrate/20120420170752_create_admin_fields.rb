class CreateAdminFields < ActiveRecord::Migration
  def change
    create_table :admin_fields do |t|
      t.string :label
      t.boolean :active
      t.integer :category_id

      t.timestamps
    end
  end
end
