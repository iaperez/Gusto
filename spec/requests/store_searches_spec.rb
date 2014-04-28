require 'spec_helper'

describe "StoreSearches" do

  it "shows store one when user searches by category" do
    visit '/searches/new'
    select 'accessories', :from => 'search[category_id]'
    click_button 'Search'
    page.should have_content "StoreNameOne"
  end


  it "shows different orders for different users" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with=>user.email
    fill_in 'Password', :with=>user.password
    click_button 'Sign in'
    #users set specific preferences
    visit '/user/preferences'
    #click_link('Link Text')
  end


end
