class Post < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true

  scope :featured, -> { where(featured: true) }

  mount_uploader :picture, PictureUploader
end
