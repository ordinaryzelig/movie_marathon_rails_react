Rails.application.routes.draw do
  resources :theaters, :only => [:index] do
    collection do
      get :search
    end
    resources :showtime_lists, :only => [:index]
  end
end
