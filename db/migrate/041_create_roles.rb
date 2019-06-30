class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table "roles" do |t|
      t.string :name, null: false, index: {unique: true}
      t.text :display_name
      t.text :note
      t.integer :position, default: 1, null: false
      t.timestamps
    end
  end
end
