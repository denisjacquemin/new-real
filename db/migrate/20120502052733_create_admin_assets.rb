class CreateAdminAssets < ActiveRecord::Migration
  def change
    create_table :admin_assets do |t|
      t.integer :theme_id
      t.string  :file
      
      t.timestamps
    end
  end
end
