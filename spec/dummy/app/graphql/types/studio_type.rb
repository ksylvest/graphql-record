module Types
  StudioType = GraphQL::Record.define(::Studio, :id, :name, :logo)
end
