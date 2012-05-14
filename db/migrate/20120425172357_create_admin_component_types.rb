class CreateAdminComponentTypes < ActiveRecord::Migration
  def change
    create_table :admin_component_types do |t|
      t.string :label

      t.timestamps
    end
  end
end
