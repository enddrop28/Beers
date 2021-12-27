class HomesController < ApplicationController
  
  def top
    # @categories = Category.all
    @post = Post.limit(4).order(" created_at DESC ")
    @posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(4).pluck(:post_id))
  end
  
  def about
  end
  
end
