require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'should test the comment model' do
    before(:each) do
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'to@example.com',
        password: '123456', confirmed_at: Time.now, posts_counter: 0)
    @user1.save!

    @post1 = Post.create(author_id: @user1.id, title: 'post1', text: 'my first post')
    @post1.save!

    @post1.comments.create(text: 'comment1')
    end

    it 'comment should be present' do
      expect(@post1.comments.length).to eq 1
    end

    it 'comment should have a correct text' do
      expect(@post1.comments.first.text).to eq 'comment1'
    end
  end
end
