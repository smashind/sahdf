class Post < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true
  validates :body, length: { minimum: 2 }
  validates :user_id, presence: true
end
