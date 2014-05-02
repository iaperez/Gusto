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
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'
    #users set specific preferences
    visit '/user/preferences'
    #click_link('Link Text')
  end


  it "Users can setup their preferences" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'
    #users set specific preferences
    visit '/user/preferences'

    page.all(:link, 'Start the quiz!').each do |link_to_preferences|
      link_to_preferences.click
      find(:css, "#answers_ids_[value='1']").set(true)
      find(:css, "#answers_ids_[value='2']").set(true)
      find(:css, "#answers_ids_[value='3']").set(false)
      find(:css, "#answers_ids_[value='4']").set(false)
      click_button 'Send your answers!'
    end
    Capybara.reset_sessions!
  end

  it "Users with different preferences get different searches" do
    visit '/users/sign_in'
    fill_in 'Email', :with => 'test@owner2.com'
    fill_in 'Password', :with => 'hola.123'
    click_button 'Sign in'
    #users set specific preferences
    visit '/user/preferences'
    page.all(:link, 'Start the quiz!').each do |link_to_preferences|
      link_to_preferences.click
      find(:css, "#answers_ids_[value='1']").set(true)
      find(:css, "#answers_ids_[value='2']").set(true)
      find(:css, "#answers_ids_[value='3']").set(false)
      find(:css, "#answers_ids_[value='4']").set(false)
      click_button 'Send your answers!'
    end
    Capybara.reset_sessions!

    visit '/users/sign_in'
    fill_in 'Email', :with => 'test@owner1.com'
    fill_in 'Password', :with => 'hola.123'
    click_button 'Sign in'
    #users set specific preferences
    visit '/user/preferences'
    page.all(:link, 'Start the quiz!').each do |link_to_preferences|
      link_to_preferences.click
      find(:css, "#answers_ids_[value='1']").set(false)
      find(:css, "#answers_ids_[value='2']").set(false)
      find(:css, "#answers_ids_[value='3']").set(true)
      find(:css, "#answers_ids_[value='4']").set(true)
      click_button 'Send your answers!'
    end
    Capybara.reset_sessions!

    visit '/users/sign_in'
    fill_in 'Email', :with => 'john_jobs@test123.com'
    fill_in 'Password', :with => 'hola.123'
    click_button 'Sign in'
    #users set specific preferences
    visit '/user/preferences'

    page.all(:link, 'Start the quiz!').each do |link_to_preferences|
      link_to_preferences.click
      find(:css, "#answers_ids_[value='1']").set(true)
      find(:css, "#answers_ids_[value='2']").set(true)
      find(:css, "#answers_ids_[value='3']").set(false)
      find(:css, "#answers_ids_[value='4']").set(false)
      click_button 'Send your answers!'
    end

    visit '/searches/new'
    click_button 'Search'
    save_and_open_page
    page.body.index("StoreNameTwo").should < page.body.index("StoreNameOne")

    visit '/user/preferences'
    page.all(:link, 'Start the quiz!').each do |link_to_preferences|
      link_to_preferences.click
      find(:css, "#answers_ids_[value='1']").set(false)
      find(:css, "#answers_ids_[value='2']").set(false)
      find(:css, "#answers_ids_[value='3']").set(true)
      find(:css, "#answers_ids_[value='4']").set(true)
      click_button 'Send your answers!'
    end

    visit '/searches/new'
    click_button 'Search'
    save_and_open_page
    page.body.index("StoreNameOne").should < page.body.index("StoreNameTwo")

  end


end
