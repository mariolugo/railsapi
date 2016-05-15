Rails.application.routes.draw do

  namespace :api, defaults: { format: :json },
            constraints: { subdomain: 'api' }, path: '/' do
    resources :users, only: [:show, :update, :destroy] do
      resources :universities, :only => [:create] 
    end
    post '/sign_in', to: 'sessions#create'
    get '/sign_out', to: 'sessions#destroy'
    post '/sign_up', to: 'users#create'
    resources :universities, :only => [:show, :index, :create]
  end

end
