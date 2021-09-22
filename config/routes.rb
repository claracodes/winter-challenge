Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.prod?
    default_url_options :host => "https://winter-challenge-clara.herokuapp.com/"
  else
    default_url_options :host => "localhost:3000"
  end

  root to: 'uploads#new'
  resources :uploads, only: [:index, :new, :create] do
    member do
      get 'emotion'
    end
  end
end
