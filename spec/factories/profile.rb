FactoryBot.define do
  factory :profile, class: Profile do
    user_group_id { UserGroup.first.id }
    required_role_id { Role.find_by(name: 'User').id }
    sequence(:user_number) { |n| "user_number_#{n}" }
    library_id { Library.find_by(name: 'kamata').id }
    locale { 'ja' }
    factory :librarian_profile, class: Profile do |profile|
      profile.required_role_id { Role.find_by(name: 'Librarian').id }
      profile.association :user, factory: :librarian
    end
    factory :admin_profile, class: Profile do |profile|
      profile.required_role_id { Role.find_by(name: 'Administrator').id }
      profile.association :user, factory: :admin
    end
  end
end
