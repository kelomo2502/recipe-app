Rails.application.routes.draw do
  root 'public_recipes#index'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods, only: [:index, :edit, :destroy]
  end
  
  resources :foods, only: [:index, :new, :create, :destroy]

  get 'public_recipes/:id', action: :show, controller: 'public_recipes'

  get 'general_shopping_list', to: 'shopping_list#missing_items'
end
