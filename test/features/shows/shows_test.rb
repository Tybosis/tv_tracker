require "test_helper"

feature "As a user I want to be able to see, edit, update and delete my show list" do

  # see my list of shows
  scenario "As a user I want to see my show list" do
    sign_in(:user1)

    visit user_shows_path

    page.text.must_include "Elementary"
    page.text.must_include "Big Bang Theory"
    page.text.must_include "Modern Family"
  end


  # add a show via the user shows list search item
  scenario "As a user I want to create my show list" do
    sign_in(:user1)

    visit new_user_show_path

    fill_in "Search", with: "Game of Thrones"

    click_on "search_btn"

    #redirected back to user show page
    page.text.must_include "Game of Thrones"
  end

  # not much of an update show is there
  # scenario "As a user I want to update my show list" do
    # sign_in(:user1)
  # end

  # delete a show from my list because I don't like it anymore
  scenario "As a user I want to delete my show list" do
    sign_in(:user1)

    visit user_shows_path

    within "Elementary" do
      click_on "Destroy"
    end

    page.text.wont_include "Elementary"
  end

  # scroll through a huge list of shows to keep track of
  scenario "As a user I want to view a list of shows to search through, clicking on one should take me to the show_show_page" do
    sign_in(:user1)

    visit shows_path

    click_on "Elementary"

    #should now be on the show show page (lol)
    page.text.must_include "Elementary"
    page.text.must_include "Add to my list"
  end

  # add shows via the show_show_page
  scenario "As a user I want to add a show via the show_show_page" do
    sign_in(:user)

    visit shows_path

    click_on "Game of Thrones"

    click_on "Add to my list"

    page.text.must_include "Game of Thrones"
  end
end
