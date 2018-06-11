class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:index, :new, :show, :edit, :update, :destroy]
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :user_params
  
  def top
  end
  
  def index
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
     @blog = Blog.new(blog_params)
    else
     @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    # @blog = Blog.create(blog_params)
    if @blog.save
      user = User.new(user_params)
      ContactMailer.contact_mail(user,@blog).deliver
      
      redirect_to new_blog_path, notexitice: 'I have added a new blog post!'
    else
     render 'new'  
    end
  end
  
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    # @blog = Blog.find(params[:id])
  end
  
  def edit
    # @blog = Blog.find(params[:id])
    
  end
  
  def update
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "I edited a blog."
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"I deleted a blog."
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end
  

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
  def login_check
    # if current_user.nil? 
    unless logged_in?
      redirect_to new_session_path 
    end 
  end
  
  # def set_user
  #   @user = User.find(params[:id])
  # end

  def user_params
    params.require(:user).permit(:name, :email,)
  end  
end
