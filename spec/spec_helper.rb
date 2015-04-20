ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'rspec/mocks'
require 'rspec/expectations'
require 'rspec/matchers'
require 'webmock/rspec'
require 'factory_girl'
require 'factory_girl_rails'
FactoryGirl.reload

if ENV['COVERAGE'].present?
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter '/vendor/'
  end
end

ActiveRecord::Migration.check_pending!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Concerns::AuthManagement, type: :controller

  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = true
  config.order = 'random'
end
