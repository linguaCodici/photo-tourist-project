Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    resources :cities, except: [:new, :edit]
  end
  
  root "home#index"
  get '/home' => "home#index"
  get '/home#' => "home#index"
end
