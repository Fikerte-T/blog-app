require 'rails_helper'

RSpec.describe 'user index features' do
  before(:each) do
    @user1 = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                          email: 'tom@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 0)
    @user2 = User.create!(name: 'Alice', photo: 'https://unsplash.com/photos/igX2deuD9lc', bio: 'Teacher from Poland.',
                          email: 'alice@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 0)
    @user3 = User.create!(name: 'John', photo: 'https://unsplash.com/photos/BXCZi9smw78', bio: 'Teacher from Mexico.',
                          email: 'john@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 0)

    visit('/users/sign_in')
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end
  describe 'Viewing the users page' do
    it 'it shows username of all other users' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Alice')
      expect(page).to have_content('John')
    end

    it 'it shows profile picture of each user' do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_css("img[src*='https://unsplash.com/photos/igX2deuD9lc']")
      expect(page).to have_css("img[src*='https://unsplash.com/photos/BXCZi9smw78']")
    end

    it 'it shows the number of posts each user has written' do
      expect(page).to have_content(0)
    end

    it 'it redirectos to that user\'s show page when user is clicked ' do
      click_link('Tom')
      expect(current_path).to eq(user_path(@user1.id))
    end
    it 'it redirectos to that user\'s show page when user is clicked ' do
      click_link('Alice')
      expect(current_path).to eq(user_path(@user2.id))
    end
    it 'it redirectos to that user\'s show page when user is clicked ' do
      click_link('John')
      expect(current_path).to eq(user_path(@user3.id))
    end
  end
end
