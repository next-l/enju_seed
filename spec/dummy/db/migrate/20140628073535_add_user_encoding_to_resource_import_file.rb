class AddUserEncodingToResourceImportFile < ActiveRecord::Migration[4.2]
  def change
    add_column :resource_import_files, :user_encoding, :string
  end
end
