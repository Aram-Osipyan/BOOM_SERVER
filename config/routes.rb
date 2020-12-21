Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server, at: '/cable'
  resource :player
  post :player_token, to: 'player_token#create'
  post :room, to: 'room#create'
  get '/room', to: 'room#show'
  post '/room/subscribe', to: 'room#subscribe_to_room'
end
