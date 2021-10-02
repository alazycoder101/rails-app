Rails.application.routes.default_url_options[:host] = 'localhost:3001'

Rails.application.routes.draw do

  root to: 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:show, :index]
    end
  end

  scope '/api/v1' do
    devise_for :users,
      :defaults => {
        :format => :json
      },
      :controllers => {
        :registrations => 'api/v1/registrations',
        :sessions => 'api/v1/sessions',
        :passwords => 'api/v1/passwords'
        #:confirmations => 'api/v1/confirmations'
      }
  end
end
