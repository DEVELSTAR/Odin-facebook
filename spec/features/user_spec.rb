require 'rails_helper'
RSpec.describe 'User', type: :feature do
  let!(:user1) { FactoryBot.create(:user, id: 1) }
  let!(:user2) { FactoryBot.create(:user, id: 2) }
  context 'when not logged in' do
    it 'requires login to continue to app' do
      visit root_path
      expect(page).to have_content "A place where ideas grow."
    end
  end

  context 'when trying to log in' do
    it 'logs the user in' do
      login_as(user1)
      visit root_path
      expect(page).to have_content "Welcome, #{user1.username.titleize}!"
    end
  end

  context 'when viewing profile of another user' do
    before do
      login_as(user1)
      visit user_path(user2.id)
    end

    it 'displays the profile' do
      expect(page).to have_content "Joined"
    end
  end

  context 'when viewing own profile' do
    before do
      login_as(user1)
      visit user_path(user1.id)
    end
    it 'does not show Add Friend button' do
      expect(page).not_to have_button "Add Friend"
    end

    it 'shows the Add profile info button when no profile created' do
      expect(page).to have_button "Add profile info"
    end
  end
end
# To open test coverage report:
# xdg-open coverage/index.html