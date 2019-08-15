class UserHasRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  accepts_nested_attributes_for :role

  before_destroy :check_role_before_destroy

  # ユーザの削除前に、管理者ユーザが不在にならないかどうかをチェックします。
  # @return [Object]
  def check_role_before_destroy
    return unless user.has_role?('Administrator')
    if UserHasRole.where(role: Role.find_by(name: 'Administrator')).count == 1
      raise user.username + ': This is the last administrator in this system.'
    end
  end
end

# == Schema Information
#
# Table name: user_has_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  role_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
