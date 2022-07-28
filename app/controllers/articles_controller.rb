class ArticlesController < ApplicationController
  def create
    # clean_params = params.require(:article).permit(:title, :content)
    # clean_params = params[:article].permit(:title, :content)
    # 避免forbbidon attributes
    
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to "/"
    else
      render "blogs/new"
      #借app/views/blogs/new/html.erb來用
      # redirect_to "blogs/new"
    end
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

end
