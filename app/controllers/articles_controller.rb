class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]
  # before_action :find_article, except: [:create] #如果有加新的action會跟著執行，上面比較明確規範

  def destroy
    @article.destroy
    redirect_to blogs_path 

  end

  def update 
    if @article.update(article_params)
      redirect_to blogs_path
    else
      render :edit
      # render "/articles/edit"
      # redirect_to edit_article_path(@article)
    end
  end
  
  def edit
  end
  
  def show 
    # Article.find(3) #find直接接id，找不到會直接出錯activeRecord::RecordNotFound，建議使用這種比較激進
    # Article.find_by(id: 3) #find_by可以接id以外的東西，找不到會得到nil
  end
  
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

  def find_article
    @article = Article.find(params[:id]) 
  end

end
