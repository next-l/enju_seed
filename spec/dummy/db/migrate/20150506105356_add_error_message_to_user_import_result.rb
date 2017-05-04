class AddErrorMessageToUserImportResult < ActiveRecord::Migration[5.0]
  def change
    add_column :user_import_results, :error_message, :text
  end
end
