Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'welcome#index', as: 'welcome'

  get '/trainers/:trainer_id/pokemons', to: 'pokemons#assigned_pokemons', as: 'assigned_trainer_pokemons'

  get '/pokemons', to: 'pokemons#index', as: 'pokemons'
  get '/pokemons/new', to: 'pokemons#new', as: 'new_pokemon'
  post '/pokemons', to: 'pokemons#create', as: 'create_pokemon'
  get '/pokemons/:id', to: 'pokemons#show', as: 'pokemon'
  get '/pokemons/:id/edit', to: 'pokemons#edit', as: 'edit_pokemon'
  patch '/pokemons/:id', to: 'pokemons#update', as: 'update_pokemon'
  delete '/pokemons/:id', to: 'pokemons#destroy', as: 'destroy_pokemon'

  get '/trainers', to: 'trainers#index', as: 'trainers'
  get '/trainers/new', to: 'trainers#new', as: 'new_trainer'
  post '/trainers', to: 'trainers#create', as: 'create_trainer'
  get '/trainers/:id', to: 'trainers#show', as: 'trainer'
  get '/trainers/:id/edit', to: 'trainers#edit', as: 'edit_trainer'
  patch '/trainers/:id', to: 'trainers#update', as: 'update_trainer'
  delete '/trainers/:id', to: 'trainers#destroy', as: 'destroy_trainer'
end
