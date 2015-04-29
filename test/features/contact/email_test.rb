require 'test_helper'

feature 'contact email' do
  test 'A user can send developers an email using the contact us form' do
    visit '/'
    click_on 'Contact Us'
    fill_in 'Name', with: 'FakeUser'
    fill_in 'Email', with: 'fake@example.com'
    fill_in 'Message', with: 'This website sucks!'
    puts page.text
    click_on 'Submit'
    page.text.must_include 'Your message has been sent!'
  end
end
