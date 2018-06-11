Rails.application.routes.draw do
  # get 'sessions/new'
  get 'blogs/root'
  resources :favorites, only: [:create, :destroy, :index]
  resources :sessions, only:[:new, :create,:show,:destroy]
  resources :users
  resources :blogs do
   collection do
     post :confirm
   end   
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/inbox"
  end
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  
root to:'blogs#top'  
end
