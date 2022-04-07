require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }
    it 'should have response status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template(:index)
    end
    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is a list of users')
    end
  end
  describe 'GET /show' do
    it 'should have response status ok' do
      get '/users/show'
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      get '/users/show'
      expect(response).to render_template(:show)
    end
    it 'response body includes correct placeholder text' do
      get '/users/show'
      expect(response.body).to include('This is a single user')
    end
  end
end
