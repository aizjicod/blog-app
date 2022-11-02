require 'rails_helper'

RSpec.describe 'Users response', type: :request do
  describe '/users' do
    before(:example) do
      User.create(
        id: 1,
        name: 'Alejandro Torres',
        photo: 'https://randomuser.me/api/portraits/men/9.jpg',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      )
      get '/users'
    end  

    it 'get /users has correct status' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end

    it 'get /users renders correct template' do
      expect(response).to render_template(:index)
    end
    it 'get /users renders correct body' do
      expect(response.body).to include('Alejandro Torres')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end
  end

  describe '/users/id' do
    before(:example) do
      User.create(
        id: 1,
        name: 'Alejandro Torres',
        photo: 'https://randomuser.me/api/portraits/men/9.jpg',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      )
      get '/users/1' 
    end 

    it 'get /users/1 has correct status' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end

    it 'get /users/1 renders correct template' do
      expect(response).to render_template(:show)
    end
    it 'get /users/1 renders correct body' do
      expect(response.body).to include('Alejandro Torres')
    end

    it 'does not render a different template' do
      expect(response).to_not render_template(:index)
    end
  end
end
