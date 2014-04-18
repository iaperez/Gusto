require 'spec_helper'

describe "StoreSearches" do
  it "shows store one when user searches by category" do
    visit '/searches/new'
    select 'accessories', :from => 'search[category_id]'
    click_button 'Search'
    page.should have_content "StoreNameOne"
  end
end
