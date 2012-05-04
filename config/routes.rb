Blogger::Application.routes.draw do
  resources :authors

  root to: 'articles#index'
  resources :articles
  resources :comments
  resources :tags
end
