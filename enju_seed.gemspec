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

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "friendly_id", "~> 5.1"
  s.add_dependency "devise", "~> 4.2"
  s.add_dependency "pundit", "~> 1.1"
  s.add_dependency "acts_as_list", "~> 0.7"
  s.add_dependency "strip_attributes", "~> 1.8"
  s.add_dependency "kaminari", "~> 0.17"
  s.add_dependency "addressable", "~> 2.3"
  s.add_dependency "sunspot_rails", "~> 2.2.5"
  s.add_dependency "cocoon"
  s.add_dependency "sitemap_generator", "~> 5.1"
  s.add_dependency "rails_autolink"
  s.add_dependency "paperclip", "~> 5.0"
  s.add_dependency "statesman", "~> 1.3"
  s.add_dependency "kramdown"
  s.add_dependency "browser", "~> 2.2"
  s.add_dependency "json_pure", "~> 1.8.3"

  s.add_development_dependency "enju_leaf", "~> 1.2.0.beta.1"
  s.add_development_dependency "enju_library", "~> 0.2.0.beta.1"
  s.add_development_dependency "enju_biblio", "~> 0.2.0.beta.1"
  s.add_development_dependency "enju_manifestation_viewer", "~> 0.2.0.beta.1"
  s.add_development_dependency "enju_circulation", "~> 0.2.0.beta.1"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "sunspot_matchers"
  s.add_development_dependency "coveralls"
end
