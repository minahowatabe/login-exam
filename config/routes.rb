Rails.application.routes.draw do
  root to:'blogs#top'  

  get 'blogs/root'
  resources :blogs do
   collection do
     post :confirm
   end   
  end

  resources :favorites, only: [:create, :destroy, :index]
  resources :sessions, only:[:new, :create,:show,:destroy]
  resources :users

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/inbox"
  end
end
