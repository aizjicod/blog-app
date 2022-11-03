require 'rails_helper'
RSpec.describe 'Users', type: :feature do
  describe 'Index' do
    before(:example) do
      @user1 = User.create(id: 1, name: 'Alejandro Torres',
                           photo: 'https://www.example.com/image', bio: 'Teacher from Colombia')
      @user2 = User.create(id: 2, name: 'Karen',
                           photo: 'https://www.example.com/image', bio: 'Teacher from India')
      visit '/users'
    end
    it 'Is response status correct' do
      expect(page).to have_http_status(:ok)
    end
    it 'Is showing all users names' do
      expect(page).to have_content @user1.name
    end
    it 'Is showing all users photos' do
      expect(page.body).to include(@user1.photo)
      expect(page.body).to include(@user2.photo)
    end
    it 'Is showing all users posts count' do
      expect(page).to have_content('0')
    end
    it 'Is redirecting to user show' do
      click_link 'Alejandro Torres'
      expect(page.current_path).to eql('/users/1')
    end
  end
end
