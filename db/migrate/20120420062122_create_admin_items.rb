class CreateAdminItems < ActiveRecord::Migration
  def change
    create_table :admin_items do |t|
      t.string  :title
      t.text    :description
      
      t.integer :type_id
      t.integer :agency_id

      t.timestamps
    end
  end
end
