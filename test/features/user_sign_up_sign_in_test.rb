require 'test_helper'

feature "A user should be able to sign up" do
  scenario "A user signs up for the site" do
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
    # Given a user is signed in
    visit "/articles"
    click_on "Sign In"
    fill_in("Email", with: "clark@dailyplanet.com")
    fill_in("Password", with: "1234fake")
    click_on "Log in"
    # When they click sign out and confirm
    click_on "Sign Out"
    # then they should be signed out and an error message should appear
    page.text.must_include('Signed out successfully')
  end
end

