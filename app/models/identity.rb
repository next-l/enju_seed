class Identity < ActiveRecord::Base
  belongs_to :profile
  validates :name, presence: true, uniqueness: {scope: :provider}
  validates :provider, presence: true

  def self.find_for_oauth(auth)
    where(name: auth.uid, provider: auth.provider).first_or_create
  end
end

# == Schema Information
#
# Table name: identities
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  profile_id      :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  provider        :string
#
