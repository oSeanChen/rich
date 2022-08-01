class BlogsController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # 寫入資料庫
    # redirect_to "/blogs"

    render html: params[:content]
    # render ({html: params[:content]}) #原本的樣子
    # render html: params["content"]
    # params是類hash的東西，符號拿法是ruby特有，其他程式語言習慣用""拿
    # symbol 是有名字的物件，如同數字
    
    # render html: "已成功新增網誌"
    
  end
end
