# GraphQL::Record

`GraphQL::Record` makes defining a GraphQL schema for a breeze by using introspection to identify the right types for a records columns and associations.

## Before:

```ruby
class FilmType
  field :id, ID, null: false
  field :name, String, null: false
  field :duration, DurationType, null: false
  field :release, DateType, null: false
  field :studio, StudioType, null: false
  field :castings, [CastingType], null: false

  def studio
    dataloader
      .with(GraphQL::Sources::ActiveRecordObject, ::Studio, key: :id)
      .load(object.studio_id)
  end

  def castings
      dataloader
      .with(GraphQL::Sources::ActiveRecordCollection, ::Casting, key: :film_id)
      .load(object.id)
  end
end
```

## After:

```ruby
FilmType = GraphQL::Record.define(::Film, :id, :name, :duration, :release, :studio, :actors)
```

## Installation

```sh
$ bundle add graphql-record
```

## Usage

Given the following schema / records:

```ruby
create_table "actors", force: :cascade do |t|
  t.string "name", null: false
end

create_table "castings", force: :cascade do |t|
  t.integer "priority", null: false
  t.bigint "actor_id", null: false
  t.bigint "film_id", null: false
end

create_table "films", force: :cascade do |t|
  t.bigint "studio_id", null: false
  t.string "name", null: false
  t.string "genre", null: false
  t.date "release", null: false
  t.interval "duration", null: false
end

create_table "studios", force: :cascade do |t|
  t.string "name", null: false
end
```

```ruby
class Actor < ApplicationRecord
  has_many :castings
  has_many :films, through: :castings
  has_many_attached :photos
  validates :name, presence: true
end

class Casting < ApplicationRecord
  belongs_to :actor
  belongs_to :film

  validates :priority, presence: true, uniqueness: { scope: :film_id }

  scope :ordered, -> { order(:priority) }
end

class Film < ApplicationRecord
  belongs_to :studio
  has_many :castings, -> { ordered }
  has_many :actors, through: :castings

  enum genre: {
    action: 'action',
    comedy: 'comedy',
    drama: 'drama',
    fantasy: 'fantasy',
    horror: 'horror',
    mystery: 'mystery',
    romance: 'romance',
    thriller: 'thriller',
  }

  validates :name, presence: true
  validates :release, presence: true
  validates :duration, presence: true
end

class Studio < ApplicationRecord
  has_many :films
  has_one_attached :logo

  validates :name, presence: true
end
```

Use `GraphQL::Record.define` to define types for the desired records:

```ruby
module Types
  ActorType = GraphQL::Record.define(::Actor, :id, :name, :photos)
  FilmType = GraphQL::Record.define(::Film, :id, :name, :release, :actors, :studio)
  StudioType = GraphQL::Record.define(::Studio, :id, :name, :logo)
end
```

Then use them in `QueryType`as needed:

```ruby
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
```
