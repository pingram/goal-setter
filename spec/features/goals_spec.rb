require 'spec_helper'

feature "goal creation process" do
  let(:user) { User.find_by_username("testing_username") }

  before(:each) do
    sign_up_as_testing_username
    visit user_url(user)
  end

  it "has a new goal form on user's show page" do
    expect(page).to have_content "New Goal"
  end

  feature "when creating a new goal" do

    before(:each) do
      fill_in_new_goal(user)
    end

    scenario "redirects to user show page" do
      click_button "Create Goal"
      expect(page).to have_content "Users#show"
    end

  end
end

feature "goal show page" do
  let(:user) { User.find_by_username("testing_username") }

  before(:each) do
    sign_up_as_testing_username
    create_new_goal(user)
  end

  scenario "user's goals should show on page" do
    expect(page).to have_content "Goal 1"
    expect(page).not_to have_content "Goal 2"
  end

  scenario "user's goals increment upon creation" do
    create_new_goal(user)
    expect(page).to have_content "Goal 1"
    expect(page).to have_content "Goal 2"
  end
end


feature "goal index" do
  let(:user1) { User.find_by_username("user1") }
  let(:user2) { User.find_by_username("user2") }

  before(:each) do
    sign_up("user1")
    create_new_goal(user1)
    create_new_goal(user1)
    fill_in_new_goal(user1)
    select('Private', from: "goal_privacy")
    click_button("Create Goal")
    click_button("Sign Out")
    sign_up("user2")
    create_new_goal(user2)
    fill_in_new_goal(user2)
    select('Private', from: "goal_privacy")
    click_button("Create Goal")
    visit goals_url
  end

  scenario "it should show all public goals" do
    expect(page).to have_content("user1")
  end

  scenario "it should show user's private goals" do
    save_and_open_page
    expect(page).to have_content("Goal 4")
  end
end