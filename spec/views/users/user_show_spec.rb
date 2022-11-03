
require 'rails_helper'
RSpec.describe 'Users', type: :feature do
  describe 'Show' do
    before(:example) do
      @user = User.create(id: 1, name: 'Alejandro Torres',
                          photo: 'https://www.example.com/image', bio: 'Teacher from Colombia')
                          Post.create(
                            id: 1,
                            title: "1-Post",
                            text: "first post",
                            user_id: 1)
                          Post.create(
                            id: 2,
                            title: "2-Post",
                            text: "second post",
                            user_id: 1)
                          Post.create(
                            id: 3,
                            title: "3-Post",
                            text: "third post",
                            user_id: 1)
      visit '/users/1'
    end
    it 'Is response status correct' do
      expect(page).to have_http_status(:ok)
    end
    it 'Is showing user names' do
      expect(page).to have_content @user.name
    end
    it 'Is showing user bios' do
      expect(page).to have_content @user.bio
    end
    it 'Is showing user pictures' do
      expect(page.body).to include(@user.photo)
    end
    it 'Is showing user posts count' do
      expect(page).to have_content('Posts: 3')
    end
    it 'Is showing button for showing all users post' do
      expect(page).to have_content('See all posts')
    end
    it 'Is showing user\'\s lasts post' do
      expect(page.body).to have_content('1-Post')
      expect(page.body).to include('2-Post')
      expect(page.body).to have_content('3-Post')
    end
    it 'Is redirecting to user show' do
      click_link '1-Post'
      expect(page.current_path).to eql('/users/1/posts/1')
    end
    it 'Is redirecting to user show' do
      click_link 'See all posts'
      expect(page.current_path).to eql('/users/1/posts')
    end
  end
end