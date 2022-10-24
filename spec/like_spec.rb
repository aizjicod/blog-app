require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(user_id: 1, post_id: 1)
  end

  before { subject.save }

  context 'user_id' do
    it 'should be 1' do
      expect(subject.user_id).to eql(1)
    end
  end

  context 'post_id' do
    it 'should be 1' do
      expect(subject.post_id).to eql(1)
    end
  end
end
