require 'rails_helper'
RSpec.describe 'User show page features' do
  before(:each) do
    @user1 = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                          email: 'tom@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 0)
    @user2 = User.create!(name: 'Alice', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          email: 'alice@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 0)
    visit('/users/sign_in')
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'

    @post1 = Post.create(author: @user1, title: 'post1', text: 'my first post')
    @post2 = Post.create(author: @user1, title: 'post2', text: 'my second post')
    @post3 = Post.create(author: @user1, title: 'post3', text: 'my third post')
    @post4 = Post.create(author: @user1, title: 'post4', text: 'my fourth post')
    @comment1 = Comment.create(author: @user2, post: @post2, text: 'comment1')
    @comment2 = Comment.create(author: @user2, post: @post2, text: 'comment2')
    @comment3 = Comment.create(author: @user2, post: @post2, text: 'comment3')
    visit user_post_path @user1.id, @post2.id
  end
  describe 'Viewing the post show page' do
    it 'shows who wrote the post.' do
      expect(page).to have_content('Tom')
    end
    it 'shows  post\'s title' do
      expect(page).to have_content('post2')
    end
    it 'shows  post\'s body' do
      expect(page).to have_content('my second post')
    end
    it 'shows comments on post with username and comment' do
      expect(page).to have_content('Alice: comment1')
      expect(page).to have_content('Alice: comment2')
      expect(page).to have_content('Alice: comment3')
    end
    it 'shows  the number of comments a post has' do
      expect(@post2.comments_counter).to eq(3)
    end
    it 'shows  the number of likes a post has' do
      expect(@post2.likes_counter).to eq(0)
    end
  end
end
