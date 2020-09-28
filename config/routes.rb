Rails.application.routes.draw do
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'orders#index'
  put '/orders/submit/:id/', to: 'orders#submit', as: 'submit'
  put '/orders/cancel/:id/', to: 'orders#cancel', as: 'cancel'
end
