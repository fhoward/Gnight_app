Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users
      post 'clock_in', to: 'attendances#clock_in'
      put  'clock_out', to: 'attendances#clock_out' 
      post '/auth/login', to: 'authentications#login'
    end
  end
end
