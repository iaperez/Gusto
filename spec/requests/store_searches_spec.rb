require 'spec_helper'

describe "StoreSearches" do

  it "shows store one when user searches by category" do
    visit '/searches/new'
    select 'accessories', :from => 'search[category_id]'
    click_button 'Search'
    page.should have_content "StoreNameOne"
  end


  it "shows different order for different users" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with=>user.email
    fill_in 'Password', :with=>user.password
    click_button 'Sign in'
    #users set specific preferences
    visit '/user/preferences'
    #click_link('Link Text')
  end


  it "Users can setup their preferences" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with=>user.email
    fill_in 'Password', :with=>user.password
    click_button 'Sign in'
    #users set specific preferences
    visit '/user/preferences'

    page.all(:link, 'Start the quiz!').each do |link_to_preferences|
      link_to_preferences.click
      find(:css, "#answers_ids_[value='1']").set(true)
      find(:css, "#answers_ids_[value='2']").set(true)
      find(:css, "#answers_ids_[value='3']").set(false)
      find(:css, "#answers_ids_[value='4']").set(false)
      #save_and_open_page
    end
  end

end
