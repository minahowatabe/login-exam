Rails.application.routes.draw do
  get 'sessions/new'
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only:[:new, :create,:show,:destroy]
  resources :users
  resources :blogs do
   collection do
     post :confirm
   end   
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end

root to:'blogs#top'  
end
