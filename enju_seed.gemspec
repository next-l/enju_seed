$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'enju_seed/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'enju_seed'
  s.version     = EnjuSeed::VERSION
  s.authors     = ['Kosuke Tanabe']
  s.email       = ['nabeta@fastmail.fm']
  s.homepage    = 'https://github.com/next-l/enju_seed'
  s.summary     = 'enju_seed plugin'
  s.description = 'Seed module for Next-L Enju'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*'] - Dir['spec/dummy/{log,tmp}/**/*'] - Dir['spec/dummy/db/*.sqlite3']

  s.add_dependency 'rails', '>= 5.1.6'
  s.add_dependency 'friendly_id', '~> 5.2'
  s.add_dependency 'devise', '~> 4.4'
  s.add_dependency 'pundit', '~> 1.1'
  s.add_dependency 'acts_as_list', '~> 0.9'
  s.add_dependency 'strip_attributes', '~> 1.8'
  s.add_dependency 'kaminari', '~> 1.1'
  s.add_dependency 'addressable', '~> 2.5'
  s.add_dependency 'sunspot_rails', '~> 2.3.0'
  s.add_dependency 'cocoon'
  s.add_dependency 'sitemap_generator', '~> 6.0'
  s.add_dependency 'rails_autolink'
  s.add_dependency 'kramdown'
  s.add_dependency 'browser', '~> 2.5'
  s.add_dependency 'simple_form'
  s.add_dependency 'validates_timeliness', '~> 4.0'
  s.add_dependency 'json_translate'
  s.add_dependency 'statesman', '~> 3.4'
  s.add_dependency 'rsolr', '~> 1.1'

  # s.add_development_dependency "enju_leaf", "~> 1.2.0"
  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rspec-activemodel-mocks'
  s.add_development_dependency 'sunspot_matchers'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'annotate'
end
