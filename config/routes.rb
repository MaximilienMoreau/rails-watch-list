Rails.application.routes.draw do
  root to: "lists#index"

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
    # reviews optionnel si tu l'as
    resources :reviews, only: %i[create]
  end

  resources :bookmarks, only: %i[destroy]
end
