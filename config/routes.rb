Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      # crud and other method of rails
      resources :users
      # for following and unfollowing user
      resources :friends, only: :index  do
        get 'list_all_friends', on: :collection
        post 'follow', on: :collection
        delete 'unfollow', on: :collection
      end

      resources :feeds, only: :index do
        get 'my_feed', on: :collection
      end
      # for time in and time out of current user
      post 'clock_in', to: 'attendances#clock_in'
      put  'clock_out', to: 'attendances#clock_out'
      
      # login for user 
      post '/auth/login', to: 'authentications#login'
    end
  end
end
