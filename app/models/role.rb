class Role < ActiveRecord::Base
  include MasterModel
  validates :name, presence: true, format: { with: /\A[A-Za-z][a-z_,]*[a-z]\z/ }
  has_many :user_has_roles
  has_many :users, through: :user_has_roles

  extend FriendlyId
  friendly_id :name
  translates :display_name

  def self.default_role
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
#  created_at                :datetime
#  updated_at                :datetime
#  score                     :integer          default(0), not null
#  position                  :integer
#  display_name_translations :jsonb            not null
#
