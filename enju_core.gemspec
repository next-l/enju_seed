$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_core"
  s.version     = EnjuCore::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["tanabe@mwr.mediacom.keio.ac.jp"]
  s.homepage    = "https://github.com/next-l/enju_core"
  s.summary     = "enju_core plugin"
  s.description = "Core module for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "friendly_id", "~> 5.0.0.alpha.1"
  s.add_dependency "kaminari"
  s.add_dependency "devise"
  s.add_dependency "cancan"
  #s.add_dependency "acts_as_list"
  s.add_dependency "attribute_normalizer", "~> 1.1"
  s.add_dependency "addressable"
  s.add_dependency "sunspot_rails", "~> 2.0.0"
  s.add_dependency "resque"
  s.add_dependency "settingslogic"
  s.add_dependency "dalli"
  s.add_dependency "nested_form"
  s.add_dependency "rails-observers"
  s.add_dependency "protected_attributes"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
end
