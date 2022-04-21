require 'rails_helper'

RSpec.describe 'User show page features' do
  before(:each) do
    @user1 = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                          email: 'tom@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 0)

    visit('/users/sign_in')
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    @post1 = Post.create(author: @user1, title: 'post1', text: 'my first post')
    @post2 = Post.create(author: @user1, title: 'post2', text: 'my second post')
    @post3 = Post.create(author: @user1, title: 'post3', text: 'my third post')
    @post4 = Post.create(author: @user1, title: 'post4', text: 'my fourth post')
    visit user_path @user1.id
  end

  describe 'Viewing the users show page' do
    it 'it shows user\'s profile picture' do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'it shows user\'s username' do
      expect(page).to have_content('Tom')
    end

    it 'it shows  the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 4')
    end
    it 'it shows  user\'s bio' do
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'it shows  user\'s first 3 posts' do
      click_link('See all posts')
      expect(page).to have_content('my fourth post')
      expect(page).to have_content('my third post')
      expect(page).to have_content('my second post')
    end

    it 'it shows link to see all posts' do
      expect(page).to have_link('See all posts')
    end

    it 'it redirectos to that user\'s posts show page when post is clicked ' do
      click_link('See all posts')
      click_link('post1')
      expect(current_path).to eq(user_post_path(@user1.id, @post1.id))
    end
    it 'it redirectos to that user\'s post index when see all posts is clicked ' do
      click_link('See all posts')
      expect(current_path).to eq(user_posts_path(@user1.id))
    end
  end
end
