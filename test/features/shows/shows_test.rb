require "test_helper"

feature "As a user I want to be able to see, edit, update and delete my show list" do

  # see my list of shows
  scenario "As a user I want to see my show list" do
    sign_in(:superman)

    visit profile_shows_index_path

    page.text.must_include "Elementary"
    page.text.must_include "Big Bang Theory"
    page.text.must_include "Modern Family"
  end


  # search for a show on the shows_show page
  scenario "As a user I want to be able to search for a show" do
    sign_in(:superman)

    visit "/shows"

    fill_in "Search", with: "Game of Thrones"

    click_on "Search"

    page.text.must_include "Game of Thrones"

    click_on "Game of Thrones"

    page.text.must_include "Seven noble families fight for control of the mythical land of Westeros"
  end

  # delete a show from my list because I don't like it anymore
  scenario "As a user I want to delete my show list" do
    sign_in(:superman)

    visit profile_shows_index_path

    within "Elementary" do
      click_on "Destroy"
    end

    page.text.wont_include "Elementary"
  end

  # scroll through a huge list of shows to keep track of
  scenario "As a user I want to view a list of shows to search through, clicking on one should take me to the show_show_page" do
    sign_in(:superman)

    visit shows_path
    puts page.text

    #should now be on the show show page (lol)
    page.text.must_include "Elementary"
    page.text.must_include "Add"
  end

  # add shows via the show_show_page
  scenario "As a user I want to add a show via the show_show_page" do
    sign_in(:superman)

    visit shows_path

    click_on "Big Bang Theory"

    click_on "Add"

    page.text.must_include "Big Bang Theory"
  end

  # search should return a list of shows from tvdb
  scenario "Search should return multiple results" do
    sign_in(:superman)

    visit "/shows"

    fill_in "Search", with: "the flash"

    click_on "Search"

    page.text.must_include "The Flash"
    page.text.must_include "The Flash (2014)"
    page.text.must_include "The Flash (1967)"
  end

  scenario "Searched shows should show up in the show index page" do
    sign_in(:superman)

    visit "/shows"

    fill_in "Search", with: "The Simpsons"

    click_on "The Simpsons"

    visit "/shows"

    page.text.must_include
  end
end
