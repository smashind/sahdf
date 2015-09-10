require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject(:user) { FactoryGirl.build :user }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }

  describe "when name is not present" do 
  	before { user.name = nil }
  	it { is_expected.to_not be_valid }
  end

  describe "when email is not present" do 
  	before { user.email = nil }
  	it { is_expected.to_not be_valid }
  end

end