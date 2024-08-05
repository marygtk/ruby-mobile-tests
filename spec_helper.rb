# frozen_string_literal: true
require 'rspec'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use the specified formatter
  config.formatter = :documentation
end
