Rails.application.routes.draw do
  namespace :admin do
    resources :applications
    resources :sections
    resources :rows
    resources :columns
    resources :inputs
  end

  resources :applications
  resources :submissions
end
