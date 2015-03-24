ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CapybaraTestCase < MiniTest::Spec
  include Capybara::DSL
  register_spec_type(/page$/, self)
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def sign_in(user)
    visit new_user_session_path
    fill_in "Email", with: users(user).email
    fill_in "Password", with: '1234fake'
  end
end
