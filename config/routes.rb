Rails.application.routes.draw do

  get '', to: 'sign#signin_form'
  post '', to: 'sign#signin'
  get 'signup', to: 'sign#signup_form'
  post 'signup', to: 'sign#signup'
  get 'home', to: 'home#index'
  get 'team/create', to: 'team#create_form'
  post 'team/create', to: 'team#create'
  get 'schedule/team', to: 'schedule#team_schedule'
  get 'schedule/teammate', to: 'schedule#teammate_schedule'
  post 'schedule/:id', to: 'schedule#schedule'
  get 'team/:id', to: 'team#detail'
  post 'team/join/:id', to: 'team#join'
  post 'team/change', to: 'team#change'
  get 'match', to: 'match#search'
  get 'talk', to: 'talk#index'
  get 'room/:id', to: 'talk#room'
  post 'talk/new/:id', to: 'talk#new'
  post 'massage/create/:id', to: 'talk#create'
  get 'profile/:id', to: 'profile#show'
  post 'logout', to: 'sign#logout'

end
