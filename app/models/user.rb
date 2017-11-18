class User < ApplicationRecord
	before_create :create_remember_token
	has_secure_password
	has_many :posts
	
	private
	def create_remember_token
		self.remember_token = User.encrypt_token(User.new_token)
	end 

	def User.new_token
		SecureRandom.urlsafe_base64
	end 

	def User.encrypt_token token
		Digest::SHA1.hexdigest(token.to_s)
	end 
end
