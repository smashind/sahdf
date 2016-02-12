class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :body, presence: true

  scope :featured, -> { where(featured: true) }

  mount_uploader :picture, PictureUploader
end
