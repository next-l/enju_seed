class EnjuSeed::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  desc "Create a setup file for Next-L Enju"

  def copy_setup_files
    directory("db/fixtures", "db/fixtures/enju_seed")
    rake("enju_seed_engine:install:migrations")
  end
end
