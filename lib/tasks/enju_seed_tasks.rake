namespace :enju_seed do
  desc "create initial records for enju_seed"
  task setup: :environment do
    Dir.glob(Rails.root.to_s + '/db/fixtures/enju_seed/*.yml').each do |file|
      ActiveRecord::FixtureSet.create_fixtures('db/fixtures/enju_seed', File.basename(file, '.*'))
    end
  end

  desc "upgrade enju_seed to enju_leaf 2.0"
  task upgrade_20: :environment do
    sql = 'UPDATE users SET profile_id = profiles.id FROM profiles WHERE profiles.user_id = users.id;'
    ActiveRecord::Base.connection.execute(sql)
  end
end
