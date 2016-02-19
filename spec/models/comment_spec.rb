require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  subject(:comment) { FactoryGirl.build(:comment) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:body) }
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:post_id) }

  describe "when body is not present" do
  	before { comment.body = nil }
  	it { is_expected.to_not be_valid }
  end
end
