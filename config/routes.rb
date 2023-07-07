Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'welcome#index', as: 'welcome'

  get '/pokemons', to: 'pokemons#index', as: 'pokemons'
  get '/pokemons/new', to: 'pokemons#new', as: 'new_pokemon'
  post '/pokemons', to: 'pokemons#create', as: 'create_pokemon'
  get '/pokemons/:id', to: 'pokemons#show', as: 'pokemon'
  get '/pokemons/:id/edit', to: 'pokemons#edit', as: 'edit_pokemon'
  patch '/pokemons/:id', to: 'pokemons#update', as: 'update_pokemon'
  delete '/pokemons/:id', to: 'pokemons#destroy', as: 'destroy_pokemon'
end
