Rails.application.routes.draw do
  resources :applications
  resources :sections
  resources :rows
  resources :columns
  resources :inputs
end
