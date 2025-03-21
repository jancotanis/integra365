# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'integra365'
require 'minitest/autorun'
require 'minitest/spec'
require 'dotenv'

def respond_to_template(template, object, class_name)
  template.keys do |key|
    assert  object.respond_to?(key.to_sym), "method #{class_name}.#{key}"
  end
end

Dotenv.load
