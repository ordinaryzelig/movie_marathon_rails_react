Rails.application.routes.draw do
  root 'theaters#index'

  resources :theaters, :only => [:index] do
    collection do
      get :search
    end
    resources :showtime_lists, :only => [:index], :path => 'showtimes'
  end
end
