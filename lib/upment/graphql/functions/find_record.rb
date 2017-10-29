# frozen_string_literal: true

module Functions
  class FindRecord < GraphQL::Function
    attr_reader :type

    def initialize(model:, type:, role: nil)
      @model = model
      @type = type
      @role = role
    end

    argument :id, GraphQL::ID_TYPE

    def call(_obj, args, ctx)
      user = ctx[:current_user]

      if @role.nil? || (user && RoleRepository.new.with_role?(user.id, @role))
        repository.find(args.id)
      else
        GraphQL::ExecutionError.new('Forbidden')
      end
    end

    private

    def repository
      @repository ||= @model.new
    end
  end
end
