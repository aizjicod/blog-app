require 'rails_helper'
RSpec.describe Comment, type: :model do
  # tests go here
  subject do
    Comment.new(text: 'Lorem ipsum, ipsum lorem')
  end

  before { subject.save }

  it 'text should be Lorem ipsum, ipsum lorem' do
    expect(subject.text).to match('Lorem ipsum, ipsum lorem')
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text length should be less than 300 characters' do
    subject.text = 'abcdefgh' * 108
    expect(subject).to_not be_valid
  end
end
