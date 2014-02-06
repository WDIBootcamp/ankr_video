AnkrVideo::Application.routes.draw do
  
  get "sessions/new"
  get "sessions/destroy"
  get "users/new"
  get "users/show"
  get "users/create"
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


#           Prefix Verb   URI Pattern                       Controller#Action
#     sessions_new GET    /sessions/new(.:format)           sessions#new
# sessions_destroy GET    /sessions/destroy(.:format)       sessions#destroy
#        users_new GET    /users/new(.:format)              users#new
#       users_show GET    /users/show(.:format)             users#show
#     users_create GET    /users/create(.:format)           users#create
#         sessions GET    /sessions(.:format)               sessions#index
#                  POST   /sessions(.:format)               sessions#create
#      new_session GET    /sessions/new(.:format)           sessions#new
#     edit_session GET    /sessions/:id/edit(.:format)      sessions#edit
#          session GET    /sessions/:id(.:format)           sessions#show
#                  PATCH  /sessions/:id(.:format)           sessions#update
#                  PUT    /sessions/:id(.:format)           sessions#update
#                  DELETE /sessions/:id(.:format)           sessions#destroy
#            users GET    /users(.:format)                  users#index
#                  POST   /users(.:format)                  users#create
#         new_user GET    /users/new(.:format)              users#new
#        edit_user GET    /users/:id/edit(.:format)         users#edit
#             user GET    /users/:id(.:format)              users#show
#                  PATCH  /users/:id(.:format)              users#update
#                  PUT    /users/:id(.:format)              users#update
#                  DELETE /users/:id(.:format)              users#destroy
# add_comment_video POST   /videos/:id/add_comment(.:format) videos#add_comment
# upload_new_video POST   /videos/new/upload(.:format)      videos#upload
# save_video_new_video GET    /videos/new/save_video(.:format)  videos#save_video
#           videos GET    /videos(.:format)                 videos#index
#                  POST   /videos(.:format)                 videos#create
#        new_video GET    /videos/new(.:format)             videos#new
#       edit_video GET    /videos/:id/edit(.:format)        videos#edit
#            video GET    /videos/:id(.:format)             videos#show
#                  PATCH  /videos/:id(.:format)             videos#update
#                  PUT    /videos/:id(.:format)             videos#update
#                  DELETE /videos/:id(.:format)             videos#destroy
#             root GET    /                                 videos#index
#           signin GET    /signin(.:format)                 sessions#new
#           signup GET    /signup(.:format)                 users#new
#          signout DELETE /signout(.:format)                sessions#destroy