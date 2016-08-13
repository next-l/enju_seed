# desc "Explaining what the task does"
# task :enju_seed do
#   # Task goes here
# end
namespace :enju_seed do
  desc "upgrade enju_seed"
  task :upgrade => :environment do
    Rake::Task['statesman:backfill_most_recent'].invoke('UserExportFile')
    Rake::Task['statesman:backfill_most_recent'].invoke('UserImportFile')
  end
end
