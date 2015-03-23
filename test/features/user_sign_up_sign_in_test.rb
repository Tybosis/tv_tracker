require 'test_helper'

feature "A user should be able to sign up" do
  scenario "A user signs up for the site successfully" do
    visit "/"
    click_on "Sign Up"
    fill_in("Email", with: "hello@gmail.com")
    fill_in("Password", with: "1234fake")
    fill_in("Password confirmation", with: "1234fake")
    click_on "Sign up"
    page.text.must_include('Welcome! You have signed up successfully.')
    page.text.wont_include('Unable to sign in. Please try again.')
  end

  scenario "User signs in and then logs out successfully" do
    visit "/"
    click_on "Sign In"
    fill_in("Email", with: "clark@dailyplanet.com")
    fill_in("Password", with: "1234fake")
    click_on "Log in"
    click_on "Sign Out"
    page.text.must_include('Signed out successfully')
  end

  scenario "User signs in and edits email address" do
    visit "/"
    click_on "Sign In"
    fill_in("Email", with: "clark@dailyplanet.com")
    fill_in("Password", with: "1234fake")
    click_on "Log in"
    click_on "Preferences"
    fill_in("Email", with: "bruce@wayneenterprises.com")
    fill_in("Current password", with: "1234fake")
    click_on "Update"
    page.text.must_include("Your account has been updated successfully.")
    users(:superman).email.must_equal "bruce@wayneenterprises.com"
  end
end
