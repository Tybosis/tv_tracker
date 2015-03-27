require "test_helper"

feature "As a user I want to be able to see, edit, update and delete my show list" do

  before do
    sign_in
    create_profile
  end

  # see my list of shows
  scenario "As a user I want to see my show list" do
    add_show
    click_on "My Shows"
    page.text.must_include "Remove Show"
  end

  # search for a show on the shows_show page
  scenario "As a user I want to be able to search for a show" do
    visit "/shows"
    fill_in("Search", with: "Game of Thrones")
    click_on "Search"
    page.text.must_include "Game of Thrones"
    click_on "Game of Thrones"
    page.text.must_include "Seven noble families fight for control of the mythical land of Westeros"
  end

  # delete a show from my list because I don't like it anymore
  scenario "As a user I want to delete a show from my showlist" do
    add_show
    visit "/shows"
    click_on "Add to profile"
    click_on "My Shows"
    page.html.must_include "img src"
    all('a').select { |link| link.text == "Remove Show" }.first.click
    page.html.wont_include "Remove Show"
  end

  # scroll through a huge list of shows to keep track of
  scenario "As a user I want to browse through shows, clicking on one should take me to the show_show_page" do
    add_show
    visit shows_path
    find(:xpath, "//a[@href='/shows/1']").click
    page.text.must_include "Big Bang Theory"
  end

  # add shows via the show_show_page
  scenario "As a user I want to add a show via the show_show_page" do
    visit "/"
    fill_in "Search", with: "Gotham"
    click_on "Search"
    click_on("Gotham", match: :first)
    click_on "Add"
    page.text.must_include "Remove Show"
  end

  # search should return a list of shows from tvdb
  scenario "A good search should return multiple results" do
    visit "/shows"
    fill_in("Search", with: "the flash")
    click_on "Search"
    page.text.must_include "The Flash"
    page.text.must_include "The Flash (2014)"
    page.text.must_include "The Flash (1967)"
  end

  scenario "Searched shows should show up in the show index page" do
    visit "/shows"
    fill_in("Search", with: "the simpsons")
    click_on "Search"
    click_on "The Simpsons"
    visit "/shows"
    page.html.must_include "img src"
  end

  scenario "A bad search will return a 'No shows found' message " do
    visit "/shows"
    fill_in("Search", with: "difjdsjfoui")
    click_on "Search"
    page.text.must_include "No Search Results. Please try again."
  end
end
