# frozen_string_literal: true

get '/graphql', to: 'graphql#index'
post '/graphql', to: 'graphql#index'
options '/graphql', to: 'graphql#index'
