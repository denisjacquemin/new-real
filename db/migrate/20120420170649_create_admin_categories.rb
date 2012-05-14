class CreateAdminCategories < ActiveRecord::Migration
  def change
    create_table :admin_categories do |t|
      t.string  :label
      t.boolean :active
      t.integer :agency_id
      
      t.timestamps
    end
  end
end
