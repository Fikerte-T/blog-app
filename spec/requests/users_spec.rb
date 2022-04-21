require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                           email: 'tom@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 0)
      get users_path
    end
    it 'should have response status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template(:index)
    end
    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Tom')
    end
  end
  describe 'GET /show' do
    before(:each) do
      @user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                           email: 'tom@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 0)
      get user_path @user.id
    end
    it 'should have response status ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template(:show)
    end
    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Tom')
    end
  end
end
