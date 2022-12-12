module PostsHelper
  
  def find_likes(object)
    if current_user
      object.likes.find_by(likeable: object, user_id: current_user.id)
    end
  end
  
end
