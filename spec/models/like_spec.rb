require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'should test the like model' do
  

    it 'like should be present' do
      @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'tt@example.com',
        password: '123456', confirmed_at: Time.now, posts_counter: 0)
      @user1.save!

      @post1 = Post.create(author_id: @user1.id, title: 'post1', text: 'my first post')
      @post1.save!
      like = Like.new(author_id: @user1.id, post_id: @post1.id)
  
      like.save!
      expect(@post1.likes.length).to eq 1
    end
  end
end
