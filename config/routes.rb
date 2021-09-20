Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'uploads#new'
  resources :uploads, only: [:index, :new, :create] do
    member do
      get 'emotion'
    end
  end
end
