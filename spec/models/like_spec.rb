require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'should test the like model' do
    user = User.create(name: 'Fikerte', photo: 'fikerte.png', bio: 'From Ethiopia')
    post = Post.create(author: user, title: 'Post', text: 'This is post 1')
    like = Like.new(post: post, author: user)

    like.save

    it 'like should be present' do
      expect(post.likes.length).to eq 1
    end
  end
end
