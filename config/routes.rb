Rails.application.routes.draw do
  root 'overview#index'
  get 'overview/index'
  get 'who_am_i', to: 'overview#who_am_i'
  get 'edit_user', to: 'overview#edit_user'
  post 'create_user', to: 'overview#create_user'
  patch 'save_me', to: 'overview#save_me'

  mount Flip::Engine => '/flip'
  get '/:id', to: 'overview#show'
end
