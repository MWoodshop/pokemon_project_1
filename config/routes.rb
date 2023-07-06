Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/', to: 'welcome#index'

  get '/pokemons', to: 'pokemons#index'
  get '/pokemons/new', to: 'pokemons#new'
  post '/pokemons', to: 'pokemons#create'
  get '/pokemons/:id', to: 'pokemons#show'
  get '/pokemons/:id/edit', to: 'pokemons#edit'
  patch '/pokemons/:id', to: 'pokemons#update'
  delete '/pokemons/:id', to: 'pokemons#destroy'
end
