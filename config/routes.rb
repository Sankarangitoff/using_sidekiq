Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # namespace :api do
  #   namespace :v1 do
  #     resources :students, only: [] do
  #       collection do
  #         post :publish_score
  #       end

  #       member do
  #         get :scores_and_ranks,on: :member
  #       end
    namespace :api do
      namespace :v1 do
        resources :students, only:[] do
          post :publish_score, on: :collection
          get 'scores_and_ranks', on: :member  # Defines a GET endpoint for scores_and_ranks
        end
    end
  end
end
