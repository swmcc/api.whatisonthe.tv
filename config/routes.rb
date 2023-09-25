Rails.application.routes.draw do
  devise_for :users

  get '/shows', to: 'api#search'
  get '/movie/:id', to: 'api#movie'
  get '/series/:id', to: 'api#series'
  get '/person/:id', to: 'api#person'
end
