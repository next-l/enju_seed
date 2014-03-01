require 'kaminari'
require 'devise'
require 'cancan'
require 'acts_as_list'
require 'attribute_normalizer'
require 'friendly_id'
require 'addressable/uri'
require 'sunspot_rails'
require 'resque/server'
require 'settingslogic'
require 'nested_form'
require 'authority'

module EnjuSeed
  class Engine < ::Rails::Engine
  end
end
