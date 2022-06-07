# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ipgeobase"

require "minitest/autorun"
require "bundler/setup"
require "simplecov"
require "webmock/minitest"

SimpleCov.start
Bundler.require

class TestCase < MiniTest::Test
  def load_fixture(filename)
    File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
  end
end
