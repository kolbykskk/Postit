Rails.application.routes.draw do

  resources :advertisements

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  post 'users/confirmation' => 'users#confirmation'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
