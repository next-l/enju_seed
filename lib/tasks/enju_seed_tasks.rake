namespace :enju_seed do
  desc "create initial records for enju_seed"
  task setup: :environment do
    Dir.glob(Rails.root.to_s + '/db/fixtures/enju_seed/*.yml').each do |file|
      ActiveRecord::FixtureSet.create_fixtures('db/fixtures/enju_seed', File.basename(file, '.*'))
    end
  end

  desc "upgrade enju_seed to enju_leaf 2.0"
  task upgrade: :environment do
    sql = 'UPDATE users SET profile_id = profiles.id FROM profiles WHERE profiles.user_id = users.id;'
    ActiveRecord::Base.connection.execute(sql)

    class_names = [
      Role
    ]
    class_names.each do |klass|
      klass.find_each do |record|
        I18n.available_locales.each do |locale|
          next unless record.respond_to?("display_name_#{locale}")
          record.update("display_name_#{locale}": YAML.safe_load(record[:display_name])[locale.to_s])
        end
      end
    end
    puts 'enju_seed: The upgrade completed successfully.'
  end
end
