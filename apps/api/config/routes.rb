# frozen_string_literal: true

post '/graphql', to: 'graphql#index'
options '/graphql', to: 'graphql#index'
get '/', to: 'graphql#index'
