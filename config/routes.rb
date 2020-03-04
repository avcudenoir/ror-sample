Rails.application.routes.draw do
  resources :high_scores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  get "/dummy" => "dummy#index", as: "dummy_index"
  get "/dummy/report" => "dummy#report", as: "dummy_report"

  # crono dashboard
  require 'crono/web'
  mount Crono::Web => "/crono"

end
