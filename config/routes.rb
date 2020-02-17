Rails.application.routes.draw do
  get 'users/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'book#top'#あとでtopに変更=>済
  resources :books, except: [:new] # new以外有効 except=を除いて
  resources :users, only: [:index, :show, :edit, :update]
end
