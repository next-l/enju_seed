class AddDateOfBirthToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :date_of_birth, :date
  end
end
