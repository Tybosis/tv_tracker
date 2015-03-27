require "test_helper"

feature "application helpers should work as expected" do
  before do
    sign_in
    create_profile
  end

  scenario "should return right message if show has no scheduled episodes" do
    visit "/shows"
    fill_in("Search", with: "Togetherness")
    click_on "Search"
    click_on "Togetherness"
    page.text.must_include "No new episodes scheduled"
  end

  test "is_playing_on should return an episode if matches the date passed in" do
    add_show
    click_on "Calendar"
    page.text.must_include "8:00 PM"
  end
end
