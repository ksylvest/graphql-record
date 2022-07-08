module Types
  ActorType = GraphQL::Record.define(::Actor, :id, :name, :photos)
end
