class HomesController < ApplicationController
  
  def top
    # @categories = Category.all
    @post = Post.limit(4).order(" created_at DESC ")
  end
  
  def about
  end
  
end
