Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :news 
      get '/news/:start/:final', to: 'news#between', as: 'news_between'
    end
  end
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
