class CreateAdminAgencies < ActiveRecord::Migration
  def change
    create_table :admin_agencies do |t|
      t.string :name
      t.string :domain

      t.timestamps
    end
  end
end
