class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, foreign_key: true
      t.references :user_group, foreign_key: true
      t.references :library, index: true
      t.string :locale
      t.string :user_number, index: {unique: true}
      t.text :full_name
      t.text :note
      t.text :keyword_list
      t.references :required_role, index: false

      t.timestamps
    end
  end
end
