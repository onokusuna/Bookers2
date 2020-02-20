Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'books#top'#あとでtopに変更=>済
  get 'home/about'
  resources :books, except: [:new] # new以外有効 except=を除いて
  resources :users, only: [:index, :show, :edit, :update]
end
