class Profile < ApplicationRecord
  scope :administrators, -> { joins(user: :role).where('roles.name = ?', 'Administrator') }
  scope :librarians, -> { joins(user: :role).where('roles.name = ? OR roles.name = ?', 'Administrator', 'Librarian') }
  has_one :user, dependent: :destroy
  belongs_to :required_role, class_name: 'Role', foreign_key: 'required_role_id'
  has_many :agents

  validates :user_number, uniqueness: true, format: { with: /\A[0-9A-Za-z_]+\z/ }, allow_blank: true
  validates :birth_date, format: { with: /\A\d{4}-\d{1,2}-\d{1,2}\z/ }, allow_blank: true

  strip_attributes only: :user_number

  attr_accessor :birth_date

  searchable do
    text :user_number, :full_name, :full_name_transcription, :note
    string :user_number
    text :username do
      user.try(:username)
    end
    text :email do
      user.try(:email)
    end
    string :username do
      user.try(:username)
    end
    string :email do
      user.try(:email)
    end
    time :created_at
    time :updated_at
    boolean :active do
      user.try(:active_for_authentication?)
    end
    integer :required_role_id
  end

  before_validation :set_role_and_agent, on: :create
  before_save :set_date_of_birth
  accepts_nested_attributes_for :user

  # 既定のユーザ権限を設定します。
  # @return [void]
  def set_role_and_agent
    self.required_role = Role.where(name: 'Librarian').first unless required_role
    self.locale = I18n.default_locale.to_s unless locale
  end

  # ユーザの誕生日を設定します。
  # @return [Time]
  def set_date_of_birth
    self.date_of_birth = Time.zone.parse(birth_date) if birth_date
  rescue ArgumentError
    nil
  end
end

# == Schema Information
#
# Table name: profiles
#
#  id                      :bigint           not null, primary key
#  user_id                 :bigint
#  user_group_id           :bigint
#  library_id              :bigint
#  locale                  :string
#  user_number             :string
#  full_name               :text
#  note                    :text
#  keyword_list            :text
#  required_role_id        :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  expired_at              :datetime
#  full_name_transcription :text
#  date_of_birth           :datetime
#  full_name_translations  :jsonb            not null
#
