module Types
  FilmType = GraphQL::Record.define(::Film, :id, :name, :release, :actors, :studio)
end
