Rails.application.routes.draw do
  devise_for :users

  get '/shows', to: 'api#fetch_posts' 
  # root "articles#index"
end
