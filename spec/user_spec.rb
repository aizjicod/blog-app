require 'rails_helper'
RSpec.describe User, type: :model do
  # tests go here
  subject { User.new(name: 'Alejandro', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a teacher') }

  before { subject.save }

  it 'the subject should be valid' do
    expect(subject).to be_valid
  end

  it 'the name value should be present and be Alejandro' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'the name value should be present and be Alejandro' do
    expect(subject.name).to eq('Alejandro')
  end

  context 'recent_posts' do
    before(:each) do
      5.times do |index|
        Post.create(title: "Post #{index}", text: "text #{index}", user: subject)
      end
    end

    it 'should return the 3 latest posts' do
      expect(subject.recent_posts).to eq(Post.order(created_at: :desc).limit(3))
    end

    it 'subject post_counter should be 5' do
      expect(subject.posts_counter).to eq(5)
    end
  end
end
