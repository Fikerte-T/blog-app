require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'should test model validations' do
    user = User.create(name: 'Fikerte', bio: 'Developer')
    subject {Post.new(user: user, title: 'Post', text: 'This is post 1', comments_counter: 6, likes_counter: 4)}
    
    
    before {subject.save}

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should not be too long' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'comments counter should be greater that 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'comments counter should be interger' do
      subject.comments_counter = 'zero'
      expect(subject).to_not be_valid
    end

    it 'likes counter should be greater that 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes counter should be interger' do
      subject.likes_counter = 'zero'
      expect(subject).to_not be_valid
    end
  end

  describe 'should test recent comments method' do
   
    it 'recent comments should return five comments' do
      expect(subject.recent_comments).to eq(subject.comments.last(5))
    end
  end
end
