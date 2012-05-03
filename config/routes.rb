Blogger::Application.routes.draw do
  root to: 'articles#index'
  resources :articles
  resources :comments
  resources :tags
end
