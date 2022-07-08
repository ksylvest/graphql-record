class ApplicationSchema < GraphQL::Schema
  query ::Types::QueryType

  use GraphQL::Dataloader
end
