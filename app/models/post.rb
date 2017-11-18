class Post < ApplicationRecord
  belongs_to :user

  def post_owner post 
  	@owner = User.find_by(id: post.user_id)
  	@owner.name
  end 
end
