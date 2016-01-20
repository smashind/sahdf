require 'rails_helper'

RSpec.describe Favorite, type: :model do
  
  subject(:favorite) { FactoryGirl.create(:favorite) }

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:favorited_type) }
  it { is_expected.to respond_to(:favorited_id) }
  it { is_expected.to respond_to(:user_id) }
  
end