Rails.application.routes.draw do
  resources :communes, only: [:index, :show, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
