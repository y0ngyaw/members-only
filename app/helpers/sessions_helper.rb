module SessionsHelper
	def log_in user
		token = User.new_token
		cookies.permanent[:remember_token] = token
		user.update_attribute(:remember_token, User.encrypt_token(token))
		self.current_user = user
	end 

	def current_user
		@current_user ||= User.find_by(remember_token: User.encrypt_token(cookies[:remember_token]))
	end 

	def current_user= user 
		@current_user = user
	end 

	def logged_in?
		!current_user.nil?
	end 

	def log_out
		current_user.update_attribute(:remember_token, User.encrypt_token(User.new_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end 
end
