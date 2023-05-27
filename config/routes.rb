Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

resources :users do 
  collection do
    post :bulk_order_delete
  end
end
resources :profiles
resources :books do
  member do
    put :publish_book
  end
  collection do
    get :all_publish_book
    get :all_draft_book
  end
end
resources :orders, only: [:index] do
  collection do
    post :create_order
  end
  member do
    get :show_order
    put :update_order
  end
end

namespace :prof do

  resources :posts
  resources :comments
  resources :events
  resources :forums

end



end
