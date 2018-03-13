require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/'
  add_filter '/.bundle/'
  add_filter '/bin/'
  add_group 'Imasgen', '/lib/'
end

require 'bundler/setup'
require 'imasgen'
require 'logger'
# needs to load first
require 'imasgen_shared'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    @logger ||= Logger.new(STDOUT)
  end
end
