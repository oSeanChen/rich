class BlogsController < ApplicationController
  before_action :require_login?, only:[:show]
 
  def show
    @blog = Blog.find_by!(handler: params[:handler])

  #   #誰來我家
    if @blog != current_user.blog
      if @blog.visitors.include?(current_user)
        @blog.visitors.destroy(current_user)
      end

      @blog.visitors << current_user
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.build_blog(blog_params)
    if @blog.save
      redirect_to "/@#{@blog.handler}", notice: "已成功建立 Blog"
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:handler, :title, :description)
  end

end
