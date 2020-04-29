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

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/{log,tmp}/**/*"] - Dir["spec/dummy/db/*.sqlite3"]

  s.add_dependency "rails", "~> 5.1"
  s.add_dependency "friendly_id", "~> 5.2"
  s.add_dependency "devise", "~> 4.7"
  s.add_dependency "pundit", "~> 2.1"
  s.add_dependency "acts_as_list"
  s.add_dependency "strip_attributes", "~> 1.11"
  s.add_dependency "kaminari", "~> 1.2"
  s.add_dependency "addressable", "~> 2.7"
  s.add_dependency "sunspot_rails", "~> 2.5"
  s.add_dependency "cocoon"
  s.add_dependency "sitemap_generator", "~> 6.1"
  s.add_dependency "rails_autolink"
  s.add_dependency "paperclip"
  s.add_dependency "kramdown"
  s.add_dependency "browser", "~> 4.0"
  s.add_dependency "simple_form"
  s.add_dependency "validates_timeliness", "~> 4.0"
  s.add_dependency "globalize", "~> 5.2"
  s.add_dependency "globalize-accessors"

  s.add_development_dependency "enju_leaf", "~> 1.3.3"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "rspec-activemodel-mocks"
  s.add_development_dependency "sunspot_matchers"
  s.add_development_dependency "coveralls", '~> 0.8.23'
  s.add_development_dependency "selenium-webdriver"
  s.add_development_dependency "puma"
  s.add_development_dependency "annotate"
  s.add_development_dependency "sprockets", '~> 3.7'
  s.add_development_dependency "simplecov"
  s.add_development_dependency "brakeman"
end
