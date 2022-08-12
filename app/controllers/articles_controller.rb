class ArticlesController < ApplicationController
  before_action :require_login?, except: [:show, :unlock]
  before_action :find_user_article, only: [:edit, :update, :destroy]
  before_action :find_article, only: [:show, :unlock]
  # before_action :find_article, except: [:create] #如果有加新的action會跟著執行，上面比較明確規範

  def index
    # where 判斷當deleted at沒東西就顯示(案過刪除就不顯示); order desc降冪
    @articles = Article.order(id: :desc)
  end

  def new
    @article = Article.new
  end



  def destroy
    @article.destroy
    # 不是真的刪除，留下點下刪除的時間
    # @article.update(deleted_at: Time.now)
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
    @comment = Comment.new
    @comments = @article.comments.order(id: :desc)
    # Article.find(3) #find直接接id，找不到會直接出錯activeRecord::RecordNotFound，建議使用這種比較激進
    # Article.find_by(id: 3) #find_by可以接id以外的東西，找不到會得到nil
  end

  def unlock
    # 判斷pincode與輸入相同
    if @article.pincode == params[:pincode]
      # 用陣列去記錄解鎖成功的文章id，對應陣列內有出現過就不用重複再解鎖
      set_unlock_articles(@article.id)
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article) , notice: "密碼錯誤"
    end
 end

    
  end
  
  def create
    # clean_params = params.require(:article).permit(:title, :content)
    # clean_params = params[:article].permit(:title, :content)
    # clean後可以避免forbbidon attributes

    # @article = Article.new(article_params)
    # @article.user = current_user
    @article = current_user.articles.new(article_params) #可以省略上面兩行

    if @article.save
      # flash[:notice] = "文章建立成功"
      redirect_to "/", notice: "文章建立成功"
    else
      render "blogs/new"
      #借app/views/blogs/new/html.erb來用
      # redirect_to "blogs/new"
    end
  end
  
  def own?(article)
    article.user == self  
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :pincode)
  end

  def find_user_article
    @article = current_user.articles.find(params[:id]) 
  end

  def find_article
    @article = Article.find(params[:id]) 
  end

  def set_unlock_articles(article_id)
    # unlock_articles 是自己命名的
    if session[:unlock_articles]
      session[:unlock_articles] << article_id
      session[:unlock_articles].uniq!
    else
      session[:unlock_articles] = [article_id]
    end
  end
