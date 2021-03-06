class Role < ApplicationRecord
  include MasterModel
  validates :name, presence: true, format: { with: /\A[A-Za-z][a-z_,]*[a-z]\z/ }
  has_many :user_has_roles
  has_many :users, through: :user_has_roles

  extend FriendlyId
  friendly_id :name
  translates :display_name

  def self.default
    Role.find_by(name: 'Guest')
  end

  private
  def valid_name?
    true
  end
end

# == Schema Information
#
# Table name: roles
#
#  id                        :bigint           not null, primary key
#  name                      :string           not null
#  display_name              :string
#  note                      :text
#  position                  :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  display_name_translations :jsonb            not null
#
