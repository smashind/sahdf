class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
	validates_presence_of [:name, :email]

  has_many :posts, dependent: :destroy
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :favorited, source_type: 'Post'
  has_many :comments, dependent: :destroy

	mount_uploader :image, ImageUploader

	def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.email = auth.info.email
  		user.password = Devise.friendly_token[0,20]
  		user.name = auth.info.name
      # user.remote_image_url = auth.info.image.gsub('http://', 'https://')
  	end
  end

  def self.new_with_session(params, session)
  	super.tap do |user|
  		if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  			user.email = data["email"] if user.email.blank?
  		end
  	end
  end

  def large_image
    "https://graph.facebook.com/#{uid}/picture?type=large"
  end

  def medium_image
    "https://graph.facebook.com/#{uid}/picture?type=normal"
  end

  def admin?
    self.role == "admin"
  end

  def user?
    self.role == "user"
  end
end
