require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'should test model validations' do
    subject {User.new(name: 'Fikerte', bio: 'From Ethiopia')}

    before {subject.save}

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'post counter should be greater that 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'post counter should be interger' do
      subject.posts_counter = 'zero'
      expect(subject).to_not be_valid
    end
  end

  describe 'should test recent posts method' do
    before {5.times {|i| Post.create(author_id: subject.id, title: 'Post #{i}')}}

    it 'recent posts should return three posts' do
      expect(subject.recent_posts).to eq(subject.posts.last(3))
    end
  end
end
