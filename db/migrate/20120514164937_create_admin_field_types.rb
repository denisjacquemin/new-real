class CreateAdminFieldTypes < ActiveRecord::Migration
  def change
    create_table :admin_field_types do |t|
      t.string :label

      t.timestamps
    end
  end
end
