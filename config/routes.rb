Rails.application.routes.draw do
  resources :movies, param: :movie_id, constraints: { movie_id: /\d+/ } do
    resources :posts
    collection do
      get 'search'
    end
  end
end