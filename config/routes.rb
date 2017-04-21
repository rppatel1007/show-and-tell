Rails.application.routes.draw do
  root 'overview#index'
  get 'overview/index'

  mount Flip::Engine => '/flip'
end
