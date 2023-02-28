Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :public do
    root to: 'homes#top'
    get 'about' => "homes#about"
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'
  end


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get 'top' => 'homes#top'
    resources :items, only: [:index, :show, :new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get 'show' => 'orders/show'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
