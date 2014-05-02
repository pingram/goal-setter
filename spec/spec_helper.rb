# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'Faker'
require 'factory_girl_rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.include FactoryGirl::Syntax::Methods

end


def sign_up(username)
  visit "/users/new"
  fill_in "Username", with: username
  fill_in "Password", with: 'asdfasdf'
  click_button 'Sign Up'
end

def sign_up_as_testing_username
  sign_up("testing_username")
end

def sign_in(username, password)
  visit new_session_url
  fill_in "Username", with: username
  fill_in "Password", with: password
  click_button 'Sign In'
end

def fill_in_new_goal(user)
  visit user_url(user)
  fill_in "Name", with: Faker::Company.catch_phrase
  fill_in "Description", with: Faker::Company.bs
  select('Public', from: "goal_privacy")
end

def create_new_goal(user)
  fill_in_new_goal(user)
  click_button "Create Goal"
end