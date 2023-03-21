Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    root to: 'homes#top'
    get 'about' => "homes#about"
    get '/customers/my_page' => 'customers#show'
    get '/customers/infomation/edit' => 'customers#edit'
    patch '/customers/infomation' => 'customers#update'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :create,]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    get '/orders/:id' => 'orders#show'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
