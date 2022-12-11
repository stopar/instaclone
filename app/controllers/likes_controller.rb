class LikesController < ApplicationController
  # def create
  #   @post = Post.find(params[:post_id])
  #   current_user.like!(@post)
  # end
  #
  # def destroy
  #   @post = current_user.posts.find_by(id: params[:post_id])
  #   current_user.likes.where(post_id: @post.id).delete_all
  # end
  
  def create
    if params[:post]
      @post = Post.find(params[:post])
      @post.likes << Like.new(user_id: current_user.id)
    end
    
    if params[:comment]
      @comment = Comment.find(params[:comment])
      @comment.likes << Like.new(user_id: current_user.id)
    end
  end
  
  def destroy
    if params[:post]
      @post = current_user.posts.find_by(id: params[:post])
      current_user.likes.where('likeable_type = ? AND likeable_id = ?', @post.class.to_s, @post.id).delete_all
    end
    
    if params[:comment]
      @comment = current_user. comments.find_by(id: params[:comment])
      current_user.likes.where('likeable_type = ? AND likeable_id = ?', @comment.class.to_s, @comment.id).delete_all
    end
  end
  
  private
  
  def likes_params
    params.require(:like).permit(:post, :comment)
  end
end