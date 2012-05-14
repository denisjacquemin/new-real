class CreateAdminThemes < ActiveRecord::Migration
  def change
    create_table :admin_themes do |t|
      t.string :title
      t.integer :agency_id

      t.timestamps
    end
  end
end
