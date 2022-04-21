require 'rails_helper'

RSpec.describe 'User show page features' do
    before(:each) do
       @user1 = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'tom@example.com',
        password: '123456', confirmed_at: Time.now, posts_counter: 0)
        
        visit('/users/sign_in')
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password
        click_button 'Log in'
        @post1 = Post.create(author: @user1, title: 'post1', text: 'my first post')
        @post2 = Post.create(author: @user1, title: 'post2', text: 'my second post')
        @post3 = Post.create(author: @user1, title: 'post3', text: 'my third post')
        @post4 = Post.create(author: @user1, title: 'post4', text: 'my fourth post')

        @comment1 = Comment.create(author: @user1, post: @post2, text: 'comment1')
        @comment2 = Comment.create(author: @user1, post: @post2, text: 'comment2')
        @comment3 = Comment.create(author: @user1, post: @post2, text: 'comment3')

        visit user_path @user1.id
       

    end

    describe 'Viewing the post index page' do
        it 'shows user\'s profile picture' do
            expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
        end

        it 'shows user\'s username' do
            expect(page).to have_content('Tom')
        end

        it 'shows  the number of posts the user has written' do
            expect(page).to have_content('Number of posts: 4')
        end
        it 'shows  post\'s title' do
            expect(page).to have_content('post2')
            expect(page).to have_content('post3')
            expect(page).to have_content('post4')
        end
        it 'shows  post\'s body' do
            expect(page).to have_content('my second post')
            expect(page).to have_content('my third post')
            expect(page).to have_content('my fourth post')
        end

        it 'it shows comments on post' do
            click_link('See all posts')
            expect(page).to have_content('comment1')
            expect(page).to have_content('comment2')
            expect(page).to have_content('comment3')          
        end
        it 'shows  the number of omments a post has' do
            expect(@post2.comments_counter).to eq(3)
        end

        it 'shows  the number of likes a post has' do
            expect(@post2.likes_counter).to eq(0)
        end
        
        it 'redirectos to that user\'s post index when see all posts is clicked ' do
            click_link('See all posts')
            expect(current_path).to eq(user_posts_path @user1.id)
            click_link('Pagination')
            expect(current_path) == (user_posts_path @user1.id)
        end

        it 'redirectos to that user\'s posts show page when post is clicked ' do
            click_link('post2')
            expect(current_path).to eq(user_post_path @user1.id, @post2.id)
        end
        
    end
  
end
