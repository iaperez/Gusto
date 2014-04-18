require 'spec_helper'

describe "AccountCreations" do
  it "create an account when user tries to sign up" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_up'
    fill_in 'Email', :with=>user.email
    fill_in 'Password', :with=>user.password
    fill_in 'Password confirmation', :with=>user.password
    click_button 'Sign up'
  end
end
