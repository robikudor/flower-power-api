Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :orders, only: [ :index, :show, :create, :update ] do
    get :finished_orders, on: :collection
  end

  resources :flowers, only: :index do
    get :recommend, on: :collection
  end
end
