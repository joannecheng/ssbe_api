ENV["RAILS_ENV"] = "test"
require File.expand_path('../dummy/config/environment', __FILE__)

require 'rspec/rails'
require 'capybara/rails'
require 'capybara/dsl'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include Capybara, :example_group => {
    :file_path => /\bspec\/integration\//
  }
end
