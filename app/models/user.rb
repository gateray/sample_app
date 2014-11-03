class User < ActiveRecord::Base
	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A(\w+[+\-.]{,1})*\w+@([a-z\d]+[\-.]{,1})*[a-z\d]+\.[a-z]{2,3}\z/i
	validates :email, presence: true, 
										format: { with: VALID_EMAIL_REGEX }, 
										uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	has_secure_password	
end
