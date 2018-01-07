class User < ApplicationRecord
	acts_as_voter
  has_many :recipes, dependent: :destroy
	has_many :comments, dependent: :destroy
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
	     :omniauthable, :omniauth_providers => [:facebook]
	
	has_attached_file :avatar, default_url: ':style/default.png', styles: { medium: "300x300>", thumb: "100x100>", icon: "30X30>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	
  
	
	def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.username = auth.info.name  
  end
end

end
