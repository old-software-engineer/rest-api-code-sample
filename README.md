# REST API Code Sample

## REST API

A REST API (also known as RESTful API) is an application programming interface (API or web API) that conforms to the constraints of REST architectural style and allows for interaction with RESTful web services.

## Rails API

Rails::API is a subset of a normal Rails application, created for applications that don't require all functionality that a complete Rails application provides. It is a bit more lightweight, and consequently a bit faster than a normal Rails application. The main example for its usage is in API applications only, where you usually don't need the entire Rails middleware stack nor template generation.

#### Things you may want to cover:

- Ruby version 2.7.2
- Rails version 6.0.6
- Database Sqlite
- JSON Web Token (JWT)
- Github

## Getting Started

To get the local rails server running :

- `bundle install` to install all reqired rails dependencies
- `rake db:migrate` to make all database migrations
- `rails s` to start the local server.

## Screenshots
![screenshot-localhost_3000-2022 11 07-15_29_29](https://user-images.githubusercontent.com/15182066/200840898-9965095a-d624-43bf-b005-c2cb31468b69.png)
![screenshot-localhost_3000-2022 11 07-15_29_55](https://user-images.githubusercontent.com/15182066/200840920-b225b7fa-4a12-4393-a299-4bdc3748366a.png)

## About

REST API Code Sample is simple web application which implements basic CRUD operations on Books, using Rails api and JWT for for securely transmitting information between parties as a JSON object.

## Concept

### Associations:

- **_The has_many Association_** :

A has_many association indicates a one-to-many connection with another model.
This association indicates that each instance of the model has zero or more instances of another model.

- **_The belongs_to Association_** :

A belongs_to association sets up a connection with another model, such that each instance of the declaring model "belongs to" one instance of the other model.

### Representers :

Representers help to parse and render documents for JSON or XML APIs.

- **Book Representer** :

```shell
class BookRepresenter
  def initialize(book)
    @book = book
  end

  def as_json
    {
      id: book.id,
      title: book.title,
      author_name: "#{book.author.first_name} #{book.author.last_name}",
      author_age: book.author.age
    }
  end
end
```

### Active Model Serializers :

ActiveModelSerializers is a library which helps to build an object, which is returned to create a JSON object.

- **Author Serializer** :

```shell
class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :age
  has_many :books
end
```

### JSON Web Token (JWT) :

JSON Web Token (JWT) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object.

## Models :

**Author** :

```shell
class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end

```

**Book** :

```shell
class Book < ApplicationRecord
  belongs_to :author
end
```

**User**:

```shell
class User < ApplicationRecord
  has_secure_password
end

```

## Gems

- JSON Web Token (JWT)
- Rubocop Rails
- Active Model Serializers

## Formatting

### Rubocop

- RuboCop is a Ruby code style checking and code formatting tool.
  ​

```shell
    gem 'rubocop-rails'
```
