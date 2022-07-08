namespace :graphql do
  namespace :schema do
    desc 'Generate a "app/graphql/application_schema.graphql"'
    task generate: :environment do
      File.write(Rails.root.join('app/graphql/application_schema.graphql'), ApplicationSchema.to_definition)
    end
  end
end
