require 'simplecov'

SimpleCov.profiles.define 'hanami' do
  add_filter '/config/'
  add_filter '/spec/'
  add_filter '/apps/api/application'

  add_group 'API', 'apps/api/controllers'
  add_group 'Entities', 'lib/upment/entities'
  add_group 'Repositories', 'lib/upment/repositories'
  add_group 'GraphQL', 'lib/upment/graphql'
  add_group 'Mailers', 'lib/upment/mailers'
end
