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

  scenario "Signing in with bad info returns an error message" do
    visit "/"
    click_on "Sign In"
    fill_in("Email", with: "clark@daily_planet.com")
    fill_in("Password", with: "wrong password")
    click_on "Log in"
    page.text.must_include "Invalid email or password."
  end

  scenario "Signing in without filling in in email returns an error" do
    visit "/"
    click_on "Sign In"
    fill_in("Email", with: "")
    fill_in("Password", with: "1234fake")
    click_on "Log in"
    page.text.must_include "Invalid email or password."
  end

  scenario "Signing in without filling in in email returns an error" do
    visit "/"
    click_on "Sign In"
    fill_in("Email", with: "clark@dailyplanet.com")
    fill_in("Password", with: "")
    click_on "Log in"
    page.text.must_include "Invalid email or password."
  end

  scenario "Signin up without filling in email returns an error" do
    visit "/"
    click_on "Sign Up"
    fill_in("Email", with: "")
    fill_in("Password", with: "password")
    fill_in("Password confirmation", with: "password")
    click_on "Sign up"
    page.text.must_include "Email can't be blank"
  end

  scenario "Signing up without filling in password returns an error" do
    visit "/"
    click_on "Sign Up"
    fill_in("Email", with: "bruce@wayneenterprises.com")
    fill_in("Password", with: "")
    fill_in("Password confirmation", with: "")
    click_on "Sign up"
    page.text.must_include "Password can't be blank"
  end

  scenario "Signing up without filling in password returns an error" do
    visit "/"
    click_on "Sign Up"
    fill_in("Email", with: "bruce@wayneenterprises.com")
    fill_in("Password", with: "1234fake")
    fill_in("Password confirmation", with: "9876real")
    click_on "Sign up"
    page.text.must_include "1 error prohibited this user from being saved: Password confirmation doesn't match Password"
  end
end
