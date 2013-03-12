require 'spec_helper'

RSpec.configure do |c|
  c.include SsbeApi::Engine.routes.url_helpers, 
    :example_group => {
    :file_path => /\bspec\/integration\//
  }
end
