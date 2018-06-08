class FavoritesController < ApplicationController
  def index
    # @favorites_blogs = Favorites_blogs.all
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_url, notice: "I added #{favorite.blog.user.name}'s blog on my favorite blog lists!"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_url, notice: "I deleted #{favorite.blog.user.name}'s blog on my favorite blog lists!"
  end
  
end
