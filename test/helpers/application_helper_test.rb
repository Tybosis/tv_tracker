require "test_helper"

describe "application helpers should work as expected" do
  it "should return right message if show has no scheduled episodes" do
    sign_in
    create_profile
    visit "/shows"
    fill_in("Search", with: "Togetherness")
    click_on "Search"
    click_on "Togetherness"
    page.text.must_include "No new episodes scheduled"
  end
end
