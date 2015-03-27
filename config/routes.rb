Rails.application.routes.draw do

  devise_for :users

  resources :profiles do
    delete :remove_show_from_profile
    resources :shows
  end

  get 'select_profile/:profile_id' => 'profiles#select_profile', as: :select_profile

  get '/shows/search' => 'shows#search', as: :show_search

  resources :shows, only: [:index, :show, :create]

  get '/welcome' => 'welcome#index'
  root 'static#index'
end
