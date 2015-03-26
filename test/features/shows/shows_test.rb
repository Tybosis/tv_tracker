require "test_helper"

feature "As a user I want to be able to see, edit, update and delete my show list" do

  # see my list of shows
  scenario "As a user I want to see my show list" do
    sign_in
    add_show
    click_on "My Shows"
    page.text.must_include "Big Bang Theory"
  end


  # search for a show on the shows_show page
  scenario "As a user I want to be able to search for a show" do
    sign_in
    visit "/shows"
    fill_in "Search", with: "Game of Thrones"
    click_on "Search"
    page.text.must_include "Game of Thrones"
    click_on "Game of Thrones"
    page.text.must_include "Seven noble families fight for control of the mythical land of Westeros"
  end

  # delete a show from my list because I don't like it anymore
  scenario "As a user I want to delete my show list" do
    sign_in
    add_show
    visit "/shows"
    all('a').select { |link| link.text == "Show" }.first.click
    click_on 'Add'
    click_on "My Shows"
    page.text.must_include "Big Bang Theory"
    all('a').select { |link| link.text == "Remove Show" }.first.click
    page.text.wont_include "Big Bang Theory"
  end

  # scroll through a huge list of shows to keep track of
  scenario "As a user I want to view a list of shows to search through, clicking on one should take me to the show_show_page" do
    sign_in
    add_show
    visit shows_path
    all('a').select { |link| link.text == "Show" }.first.click
    page.text.must_include "Big Bang Theory"
    page.html.must_include "Add"
  end

  # add shows via the show_show_page
  scenario "As a user I want to add a show via the show_show_page" do
    sign_in
    add_show
    visit shows_path
    page.text.must_include "Big Bang Theory"
    all('a').select { |link| link.text == "Show" }.last.click
    page.text.must_include "Big Bang Theory"
    click_on "Add"
    page.text.must_include "Big Bang Theory"
  end

  # search should return a list of shows from tvdb
  scenario "Search should return multiple results" do
    sign_in
    visit "/shows"
    fill_in "Search", with: "the flash"
    click_on "Search"
    page.text.must_include "The Flash"
    page.text.must_include "The Flash (2014)"
    page.text.must_include "The Flash (1967)"
  end

  scenario "Searched shows should show up in the show index page" do
    sign_in
    visit "/shows"
    fill_in "Search", with: "The Simpsons"
    click_on "Search"
    click_on "The Simpsons"
    visit "/shows"
    page.text.must_include "The Simpsons"
  end

  scenario "A bad search will return a 'No shows found' message " do
    sign_in
    visit "/shows"
    fill_in "Search", with: "fkdsmfklsdm"
    click_on "Search"
    page.text.must_include "No Search Results. Please try again."
  end
end
