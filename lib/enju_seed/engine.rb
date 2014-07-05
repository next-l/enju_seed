require 'kaminari'
require 'devise'
require 'cancancan'
require 'acts_as_list'
require 'attribute_normalizer'
require 'friendly_id'
require 'addressable/uri'
require 'sunspot_rails'
require 'resque/server'
require 'settingslogic'
require 'nested_form'
require 'strong_parameters'

module EnjuSeed
  class Engine < ::Rails::Engine
  end
end
