class Role < ActiveRecord::Base
  include MasterModel
  validates :name, presence: true, format: { with: /\A[A-Za-z][a-z_,]*[a-z]\z/ }
  has_many :user_has_roles
  has_many :users, through: :user_has_roles

  extend FriendlyId
  friendly_id :name

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
#  id           :bigint(8)        not null, primary key
#  name         :string           not null
#  display_name :jsonb            not null
#  note         :text
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
