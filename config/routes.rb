Rails.application.routes.draw do
  resources :hotels do
    post :scrape, to: 'hotels#scrape', on: :collection
  end

  root to: 'hotels#index'
end
