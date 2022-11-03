require 'rails_helper'
RSpec.describe 'Posts', type: :feature do
  describe 'Index' do
    before(:example) do
      @user = User.create(id: 1, name: 'Alejandro Torres',
                          photo: 'https://www.example.com/image', bio: 'Teacher from Colombia')
      3.times do |number|
        Post.create(
          id: number,
          title: "#{number}-Post",
          text: "#{number}-number-post",
          user_id: 1
        )
      end
      Comment.create(
        user_id: 1,
        post_id: 1,
        text: 'Phasellus dapibus a dui at euismod.'
      )
      Comment.create(
        user_id: 1,
        post_id: 1,
        text: 'Phasellus dapibus a dui at euismod.2'
      )
      3.times do |_i|
        Like.create(user_id: 1, post_id: 1)
      end
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
      expect(page).to have_content('0-number-post')
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
      expect(page.body).to have_content('0-Post')
      expect(page.body).to include('1-Post')
      expect(page.body).to have_content('2-Post')
    end
    it 'Is redirecting to user show' do
      click_link '0-Post'
      expect(page.current_path).to eql('/users/1/posts/0')
    end
  end
end
