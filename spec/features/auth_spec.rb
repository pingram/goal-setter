require 'spec_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "when signing up a user" do

    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'testing_username'
      fill_in 'password', with: 'asdfasdf'
      click_button 'Sign Up'
    end

    scenario 'redirects to users show page after signup' do
      expect(page).to have_content 'Users#show'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'testing_username'
    end
  end


end

feature "logging in" do
  before(:each) do
    sign_up_as_testing_username
    click_button 'Sign Out'
    visit new_session_url
    fill_in 'username', with: 'testing_username'
    fill_in 'password', with: 'asdfasdf'
    click_button 'Sign In'

  end

  it "shows username on the homepage after login" do
    expect(page).to have_content 'Users#show'
    expect(page).to have_content 'testing_username'
  end

end

feature "logging out" do

  it "begins with logged out state" do
    visit users_url
    expect(page).to have_content "Sign Up"
  end

  it "doesn't show username on the homepage after logout" do
    sign_up_as_testing_username
    click_on 'Sign Out'
    expect(page).not_to have_content 'testing_username'
  end

end
