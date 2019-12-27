Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  post 'categories/create'
  get 'categories/edit/:id' => 'categories#edit'
  post 'categories/update/:id' => 'categories#update'
  delete 'categories/:id' => 'categories#destroy'
  get 'items/index'
  get 'items/new'
  get 'items/:id' => 'items#show'
  root "home#top"
  post 'items/create'
  get 'items/edit/:id' => 'items#edit'
  post 'items/update/:id' => 'items#update'
  delete 'items/:id' => 'items#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
