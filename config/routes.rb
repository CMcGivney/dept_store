Rails.application.routes.draw do
  
root 'depts#index'

  resources :depts do 
    resources :items
  end
  resources :items do
    resources :reviews
  end
end
