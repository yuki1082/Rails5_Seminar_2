Rails.application.routes.draw do
  root 'top#index'
  get 'lessons/form' => 'lessons#form'
  get 'lessons/register' => 'lessons#register'
  get 'lessons/hello' => 'lessons#hello'

  resources :users do
    resources :plan_items, only:[:index]
  end
  resources :plan_items do
    resources :participations, only: [:create, :destroy] do
      patch :cancel, on: :member
    end
  end

  resource :session, only: [:create, :destroy]
end
