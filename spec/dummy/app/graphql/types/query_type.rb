module Types
  class QueryType < GraphQL::Schema::Object
    field :actors, [ActorType], null: false
    field :films, [FilmType], null: false

    def actors
      ::Actor.all
    end

    def films
      ::Film.all
    end
  end
end
