class CommentsController < ApplicationController
  before_action :require_login?
  before_action :find_article, only: [:create]
  before_action :find_comment, only: [:destroy]

  def create
    @comment = @article.comments.new(comment_params)
  
    if @comment.save
      # create.js.erb
      
      # redirect_to @article, notice: "留言成功"
    else
      redirect_to @article, notice: "留言失敗"
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.article, notice: "留言已刪除"
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end

  def find_article 
    @article = Article.find(params[:article_id])
  end

  def find_comment
    @comment = current_user.comments.find(params[:id])
  end
end
