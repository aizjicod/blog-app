require 'rails_helper'
RSpec.describe 'Posts', type: :feature do
  describe 'Index' do
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
                            Comment.create(
                              user_id: 1,
                              post_id: 1,
                              text: "Phasellus dapibus a dui at euismod." )
                            Comment.create(
                              user_id: 1,
                              post_id: 1,
                              text: "Phasellus dapibus a dui at euismod.2" )
                              Like.create(user_id: 1, post_id: 1)
                              Like.create(user_id: 1, post_id: 1)
                              Like.create(user_id: 1, post_id: 1)
      visit '/users/1/posts'
    end
    it 'Is response status correct' do
      expect(page).to have_http_status(:ok)
    end
    it 'Is showing user names' do
      expect(page).to have_content @user.name
    end
    it 'Is showing user pictures' do
      expect(page.body).to include(@user.photo)
    end
    it 'Is showing user posts count' do
      expect(page).to have_content('Posts: 3')
    end
    it 'Is showing some of a post body' do
      expect(page).to have_content('third post')
    end
    it 'Is showing some of a post comments' do
      expect(page).to have_content('Phasellus dapibus a dui at euismod.2')
    end
    it 'Is showing counter of comments for a given post' do
      expect(page).to have_content('Comments: 2')
    end
    it 'Is showing counter of likes for a given post' do
      expect(page).to have_content('Likes: 3')
    end
    it 'Is showing button for showing more of the user\'s\ posts' do
      expect(page).to have_content('Pagination')
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
  end
end