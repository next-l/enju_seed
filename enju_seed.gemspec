$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_seed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_seed"
  s.version     = EnjuSeed::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "https://github.com/next-l/enju_seed"
  s.summary     = "enju_seed plugin"
  s.description = "Seed module for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 3.2.21", "< 5.0"
  s.add_dependency "friendly_id", ">= 4.0"
  s.add_dependency "kaminari", "~> 0.15.1"
  s.add_dependency "devise", "~> 3.4"
  s.add_dependency "cancancan", "~> 1.9"
  s.add_dependency "acts_as_list", "~> 0.5"
  s.add_dependency "attribute_normalizer", "~> 1.2"
  s.add_dependency "addressable"
  s.add_dependency "sunspot_rails", "~> 2.1"
  s.add_dependency "resque"
  s.add_dependency "settingslogic"
  s.add_dependency "dalli"
  s.add_dependency "nested_form"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
end
