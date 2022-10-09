Rails.application.routes.draw do

  get '', to: 'sign#signin_form'
  post '', to: 'sign#signin'
  get 'signup', to: 'sign#signup_form'
  post 'signup', to: 'sign#signup'
  get 'home', to: 'home#index'
  get 'team/create', to: 'team#create_form'
  post 'team/create', to: 'team#create'
  get 'schedule/1', to: 'schedule#between_team_schedule_form'
  get 'schedule/2', to: 'schedule#in_team_schedule_form'
  post 'schedule/:id', to: 'schedule#schedule'
  get 'team/:id', to: 'team#detail'
  post 'team/join/:id', to: 'team#join'
  post 'team/change', to: 'team#change'
  get 'match', to: 'match#search'
  get 'talk', to: 'talk#index'
  get 'room/:id', to: 'talk#room'
  post 'talk/new/:id', to: 'talk#new'
  post 'massage/create/:id', to: 'talk#create'
  get 'profile', to: 'profile#show'
  post 'logout', to: 'sign#logout'

end
