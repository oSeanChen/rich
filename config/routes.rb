Rails.application.routes.draw do
  # get "/", to: "welcome#home" 
  get "/", to: "blogs#index" 
  get "/about", to: "pages#about"

  # get "/blog", to: "blog#index"
  # get "/blog/new", to: "blog#new"
  # post "/blog", to: "blog#create"
  # get "/blog/:id", to: "blog#show"
  # get "/blog/:id/edit", to: "blog#edit"
  # patch "/blog/:id", to: "blog#update"
  # delete "/blog/:id", to: "blog#destory"

  #REST 直接用resources生出對應路徑
  resources :blogs
  resources :articles 
  # 可直接更改所有路徑
  # resources :blogs, path:"helloworld" 
  
  # only只開...
  # resources :blog, only: [:index,:show]
  
  # except除了...都開
  # resources :blog, except: [:index,:new]
  # 可用only 和 except控制那些要開啟

  # get post...都是function
  # 路徑比對由上而下，使用:id比對需要注意，id可以自己改任何字，都可以拿來比對英文字母跟數字，可以一直往後擴增
  # 常被存取的可以擺在最前面
end


# 產生controller
# $ rails g controller pages

# 刪除controller
# $ rails d controller pages