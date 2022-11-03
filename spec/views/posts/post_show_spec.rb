require 'rails_helper'
RSpec.describe 'Posts', type: :feature do
  describe 'show' do
    before(:example) do
      @user = User.create(id: 1, name: 'Alejandro Torres',
                          photo: 'https://www.example.com/image', bio: 'Teacher from Colombia')
      User.create(id: 2, name: 'Karen',
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
        user_id: 2,
        post_id: 1,
        text: 'Phasellus dapibus a dui at euismod.'
      )
      Comment.create(
        user_id: 2,
        post_id: 1,
        text: 'Phasellus dapibus a dui at euismod.2'
      )

      Like.create(user_id: 1, post_id: 1)
      Like.create(user_id: 1, post_id: 1)
      Like.create(user_id: 1, post_id: 1)
      visit '/users/1/posts/1'
    end
    it 'Is response status correct' do
      expect(page).to have_http_status(:ok)
    end
    it 'Is showing user names' do
      expect(page).to have_content @user.name
    end
    it 'Is showing user names' do
      expect(page).to have_content 'Post #1'
    end
    it 'Is showing counter of comments for a given post' do
      expect(page).to have_content('Comments: 2')
    end
    it 'Is showing counter of likes for a given post' do
      expect(page.body).to have_content('3')
    end
    it 'Is showing post body' do
      expect(page.body).to have_content('1-number-post')
    end
    it 'Is showing user posts count' do
      expect(page).to have_content('Posts: 3')
    end
    it 'Is showing comments text' do
      expect(page.body).to have_content('Phasellus dapibus a dui at euismod.2')
      expect(page.body).to include('Phasellus dapibus a dui at euismod.')
    end
    it 'Is showing comments text' do
      expect(page.body).to have_content('Karen')
      expect(page.body).to include('Karen')
    end
  end
end
