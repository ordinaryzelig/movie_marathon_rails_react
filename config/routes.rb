Rails.application.routes.draw do
  root :to => 'asdf#index'

  resources :theaters, :only => [:show] do
    collection do
      get '/search/:zipcode', :to => 'theaters#search', :as => 'search'
    end
  end
end
