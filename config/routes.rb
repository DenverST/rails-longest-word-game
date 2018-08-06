Rails.application.routes.draw do
  # get 'games/score'
  # get 'games/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'new', to: 'games#new', as: :new
  post 'score', to: 'games#score', as: :score
end
