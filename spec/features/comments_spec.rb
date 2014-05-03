require 'spec_helper'

feature "goal comment creation process" do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:goal)  { create(:goal, user: user2)}

  scenario "creates a new comment" do
    sign_in(user1.username, 'asdfasdf')
    visit goal_url(goal)
    fill_in "Comment", with: "cool goal brah"
    click_button "Add Comment"
    expect(page).to have_content("cool goal brah")
  end
end

feature "user comment creation process" do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  scenario "creates a new comment" do
    sign_in(user1.username, 'asdfasdf')
    visit user_url(user2)
    fill_in "Comment", with: "cool username brah"
    click_button "Add Comment"
    expect(page).to have_content("cool username brah")
  end
end