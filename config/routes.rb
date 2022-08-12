Rails.application.routes.draw do
  # get "/", to: "welcome#home" 
  root "pages#home" 
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
  get "/@:handler/blogs/", to: "blogs#show"
  get "/@:handler/blogs/:id", to: "articles#show"
  
  resources :articles do
    resources :comments, shallow: true, only: [:create, :destroy] 
    # 簡短捷徑 裡面三個需要/article id =>only[ index new create ] 外面四個only[]
   
    # member(有 /:id/)
    member do
      # /articles/:id/unlock
      patch :unlock
      post :like
    end
    # patch :unlock on :member
    
  #collection (無 /:id/)
    # collection do 
    # /articles/unlock
      # patch :unlock
    # end
  end

  # namespace 為了做出api開頭的路徑  api/v1/articles/:id/like
  namespace :api do
    namespace :v1 do
      resources :articles, only: [] do
        member do
          post :like
        end
      end
    end
  end
  resource :sessions, only:[:create, :destroy]
  resource :users, except: [:new, :destroy], path: "user" do
    get :sign_up
    get :sign_in
    
  end

  get "/@:handler", to: "blogs#show"
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