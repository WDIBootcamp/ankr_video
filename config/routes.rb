AnkrVideo::Application.routes.draw do
  
  resources :sessions, :users

  resources :videos do
    member do
      post :add_comment
    end     
    new do
       post :upload
       get  :save_video
     end
  end

  # via: [:get, :post] "videos/:id/add_comment", :to => "videos#add_comment"

  root :to => "videos#index"


  get'/signin' => 'sessions#new'
  get '/signup' => 'users#new'
  delete '/signout', to: 'sessions#destroy'



end


#    add_comment_video POST   /videos/:id/add_comment(.:format) {:action=>"add_comment", :controller=>"videos"}
#     upload_new_video POST   /videos/new/upload(.:format)      {:action=>"upload", :controller=>"videos"}
# save_video_new_video GET    /videos/new/save_video(.:format)  {:action=>"save_video", :controller=>"videos"}
#               videos GET    /videos(.:format)                 {:action=>"index", :controller=>"videos"}
#                      POST   /videos(.:format)                 {:action=>"create", :controller=>"videos"}
#            new_video GET    /videos/new(.:format)             {:action=>"new", :controller=>"videos"}
#           edit_video GET    /videos/:id/edit(.:format)        {:action=>"edit", :controller=>"videos"}
#                video GET    /videos/:id(.:format)             {:action=>"show", :controller=>"videos"}
#                      PUT    /videos/:id(.:format)             {:action=>"update", :controller=>"videos"}
#                      DELETE /videos/:id(.:format)             {:action=>"destroy", :controller=>"videos"}
#                             /videos/:id/add_comment(.:format) {:controller=>"videos", :action=>"add_comment"}
#                 root        /(.:format)                       {:controller=>"videos", :action=>"index"}