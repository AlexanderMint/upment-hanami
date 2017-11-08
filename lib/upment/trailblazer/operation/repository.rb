# frozen_string_literal: true

class Trailblazer::Operation
  def self.Repository(repository, action)
    step = Repository.for(repository, action)

    [step, name: 'repository.build']
  end

  class Repository
    def self.for(repository, action)
      builder = Builder.new

      lambda do |_input, options|
        options['repository']   = repository
        options['model.action'] = action

        name = action == :all ? :collection : :model

        options[name] = builder.call(options, options['params'])
        options["result.#{name}"] = result = Result.new(!options[name].nil?, {})

        result.success?
      end
    end

    class Builder
      def call(options, params)
        action      = options['model.action']
        repository  = options['repository'].new
        rep_methods = %i[create update delete all find first last clear]

        if rep_methods.include?(action)
          send(action, repository, params)
        else
          repository.send(action, params[:id])
        end
      end

      def create(repository, params)
        repository.create(params)
      end

      def update(repository, params)
        repository.update(params[:id], params)
      end

      def delete(repository, params)
        repository.delete(params[:id])
      end

      def all(repository, params)
        params[:limit] ||= 10
        params[:order] ||= :desc

        repository.root.limit(params[:limit]).order(Sequel.send(params[:order], :created_at)).call.collection
      end

      def find(repository, params)
        repository.find(params[:id])
      end

      def first(repository, _params)
        repository.first
      end

      def last(repository, _params)
        repository.last
      end

      def clear(repository, _params)
        repository.clear
      end
    end
  end
end
