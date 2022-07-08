module Types
  class QueryType < GraphQL::Schema::Object
    field :actors, [ActorType], null: false
    field :films, [FilmType], null: false
    field :studios, [StudioType], null: false

    def actors
      ::Actor.all
    end

    def films
      ::Film.all
    end

    def studios
      ::Studio.all
    end
  end
end
