Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'articles#index'

  get '/articles/welcome',
    to: 'articles#welcome',
    as: 'welcome_article'

  resources :articles

=begin
  get '/articles',
    to: 'articles#index',
    as: 'articles'

  post '/articles',
    to: 'articles#create'

  get '/articles/new',
    to: 'articles#new',
    as: 'new_article'

  get '/articles/:id/edit',
    to: 'articles#edit',
    as: 'edit_article'

  get '/articles/:id',
    to: 'articles#show',
    as: 'article'

  patch '/articles/:id',
    to: 'articles#update'

  delete '/articles/:id',
    to: 'articles#destroy'

  #get 'hello' => 'example#hello'
=end

end
