require 'rails_helper'

RSpec.describe 'Profiles', type: :system do
  include Devise::Test::IntegrationHelpers
  fixtures :all

  describe 'When logged in as Administrator' do
    before do
      sign_in users(:admin)
    end

    it 'should show user_number' do
      visit profile_path(profiles(:admin))
      expect(page).to have_content '00001'
    end
  end

  describe 'When logged in as Librarian' do
    before do
      sign_in users(:librarian1)
    end

    it 'should show user_number' do
      visit profile_path(profiles(:admin))
      expect(page).not_to have_content '00001'
    end
  end

  describe 'When logged in as User' do
    before do
      sign_in users(:user1)
    end

    it 'should show user_number' do
      visit profile_path(profiles(:admin))
      expect(page).not_to have_content '00001'
    end
  end
end
