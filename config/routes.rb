Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :applications do
          patch 'publish', on: :member
          get 'quik_links', on: :member
        end
        resources :sections
        resources :rows
        resources :columns
        resources :inputs
      end

      resources :applications
      resources :submissions
      resources :pdfs

      get '/s/:short_url', to: 'applications#expand_short_url', as: :expand_short_url
    end
  end
end
