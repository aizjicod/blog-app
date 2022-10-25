require 'rails_helper'

RSpec.describe 'Posts response', type: :request do
  describe '/users/:id/posts' do
    before(:example) { get '/users/:id/posts' }

    it 'get has correct status' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end

    it 'get renders correct template' do
      expect(response).to render_template(:index)
    end
    it 'get renders correct body' do
      expect(response.body).to include("user's posts")
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end
  end

  describe '/users/:id/posts/:id' do
    before(:example) { get '/users/:id/posts/:id' }

    it 'get has correct status' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end

    it 'get renders correct template' do
      expect(response).to render_template(:show)
    end
    it 'get renders correct body' do
      expect(response.body).to include("user's selected post")
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:index)
    end
  end
end
