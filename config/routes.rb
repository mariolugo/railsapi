Rails.application.routes.draw do

  namespace :api, defaults: { format: :json },
            constraints: { subdomain: 'api' }, path: '/' do
    resources :users, only: [:show, :update, :destroy]
    post '/sign_in', to: 'sessions#create'
    get '/sign_out', to: 'sessions#destroy'
    post '/sign_up', to: 'users#create'
  end

end
