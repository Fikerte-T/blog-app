require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'should test the comment model' do
    user = User.create(name: 'Fikerte', photo: 'fikerte.png', bio: 'From Ethiopia')
    post = Post.create(author: user, title: 'Post', text: 'This is post 1')
    comment = Comment.new(post: post, author: user, text: 'Hi!')

    comment.save

    it 'comment should be present' do
      expect(post.comments.length).to eq 1
    end

    it 'comment should have a correct text' do
      expect(post.comments.first.text).to eq 'Hi!'
    end
  end
end
