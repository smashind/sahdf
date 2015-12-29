require 'rails_helper'

RSpec.describe Post, type: :model do
  
  subject(:post) { FactoryGirl.build :post }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:body) }
  it { is_expected.to respond_to(:user_id) }

  describe "when body is not present" do
  	before { post.body = nil }
  	it { is_expected.to_not be_valid }
  end
end
