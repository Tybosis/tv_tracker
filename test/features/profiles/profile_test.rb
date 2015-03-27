require "test_helper"

feature "as a user i should be able to create, edit, switch, and delete profiles" do
  before do
    sign_in
    create_profile
  end

  scenario "a user can create a profile" do
    visit "/profiles"
    page.text.must_include "Superman"
  end

  scenario "a user can edit an existing profile" do
    visit "/profiles"
    click_on "Edit"
    fill_in "Name", with: "New name"
    find("img[@alt='Avatar2']").click
    click_on "Update Profile"
    visit "/profiles"
    page.text.must_include "New name"
  end

  scenario "a user can create a second profile" do
    visit "/profiles"
    click_on "New Profile"
    fill_in "Name", with: "Batman"
    find("img[@alt='Avatar2']").click
    click_on "Create Profile"
    visit "/profiles"
    page.text.must_include "Superman"
    page.text.must_include "Batman"
  end

  scenario "a user can switch profiles" do
    add_show
    visit "/profiles"
    click_on "New Profile"
    fill_in "Name", with: "Second Profile"
    find("img[@alt='Avatar5']").click
    click_on "Create Profile"
    visit "/profiles"
    all("img[@alt='Avatar blank']").select { |img| img }.last.click
    page.html.wont_include "http://thetvdb.com/banners/graphical/80379-g23.jpg"
  end

  scenario "a user can delete an existing profile" do
    visit "/profiles"
    click_on "Delete"
    page.text.wont_include "Superman"
  end
end
