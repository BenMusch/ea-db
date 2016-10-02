Rails.application.routes.draw do
  root "articles#index"
  resources :articles
  resources :media_types
  resources :tags
  resources :subcategories
  resources :categories
  resources :authors
end
