require 'rails_helper'
RSpec.describe Post, type: :model do
  # tests go here
  subject do
    first_user = User.new(name: 'Alejandro', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a teacher')
    Post.new(title: 'Post 1', text: 'text 1', user: first_user)
  end

  before { subject.save }

  it 'the subject should be valid' do
    expect(subject).to be_valid
  end

  it 'the subject should not be valid' do
    subject.title = nil
    expect(subject).not_to be_valid
  end
  # rubocop:disable Layout/LineLength

  it 'the subject should not be valid since character exceed 250' do
    subject.title = 'this is a test title of 250+ characters, this is a test title of 250+ characters, this is a test title of 250+ characters, this is a test title of 250+ characters, this is a test title of 250+ characters, this is a test title of 250+ characters, this is a test title of 250+ characters,'
    expect(subject).not_to be_valid
  end

  # rubocop:enable Layout/LineLength

  it 'the subject.comments_counter should have a value of 0' do
    expect(subject.comments_counter).to eq(0)
  end

  it 'the subject.comments_counter should not be valid' do
    subject.comments_counter = -1
    expect(subject).not_to be_valid
  end

  it 'the subject.likes_counter should have a value of 0' do
    expect(subject.likes_counter).to eq(0)
  end

  it 'the subject.likes_counter should not be valid' do
    subject.likes_counter = -1
    expect(subject).not_to be_valid
  end

  it 'user should have posts_counter incremented' do
    expect(subject.user.posts_counter).to eq(1)
  end

  context 'recent_posts' do
    before(:each) do
      10.times do |index|
        Comment.create(text: "text #{index}", post: subject, user: subject.user)
      end
    end

    it 'should return the 5 latest comments' do
      expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
    end
  end
end
