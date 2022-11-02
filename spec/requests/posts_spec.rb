require 'rails_helper'

RSpec.describe 'Posts response', type: :request do
  describe '/users/:user_id/posts' do
    before(:example) do
      User.create(
        id: 1,
        name: 'Jhon First',
        photo: 'https://randomuser.me/api/portraits/men/9.jpg',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      )
      get '/users/1/posts'
    end

    it 'get has correct status' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end

    it 'get renders correct template' do
      expect(response).to render_template(:index)
    end
    it 'get renders correct body' do
      expect(response.body).to include('Pagination')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end
  end

  describe '/users/:user_id/posts/:id' do
    before(:example) do
      User.create(
        id: 1,
        name: 'Jhon First',
        photo: 'https://randomuser.me/api/portraits/men/9.jpg',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      )
      Post.create(title: 'Post-1}',
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis commodo velit.
        Maecenas quis tortor nec neque ornare pharetra vitae in quam.',
                  id: 1, user_id: 1)
      get '/users/1/posts/1'
    end

    it 'get has correct status' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end

    it 'get renders correct template' do
      expect(response).to render_template(:show)
    end
    it 'get renders correct body' do
      expect(response.body).to include('Add Comment')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:new)
    end
  end
end
