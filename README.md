# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version 2.7.2
- Rails version 6.0.6
- Database Sqlite
- Github

* Getting Started

To get the local rails server running :

- `bundle install` to install all reqired rails dependencies
- `rake db:migrate` to make all database migrations
- `rails s` to start the local server.

# Code Overview

​

## Folders

- `app/models` - Contains the database models for the application where we can define methods, validations, queries, and relations to other models.
- `app/views` - Render the react element.
- `app/controllers` - Contains the controllers where requests are routed to their actions, where we find and manipulate our models and return them for the views to render.
- `config` - Contains configuration files for our Rails application and for our database, along with an `initializers` folder for scripts that get run on boot.
- `db` - Contains the migrations needed to create our database schema.
  ​

## JWT on Rails

​

- `JSON Web Token (JWT)` gem is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object.
  ​

```shell
  gem 'jwt'

```

​

### Add New Component in React

- To create new Component, Go to `app/javascript/component` add `.js` file.
- Example

```shell
  import React from 'react';
​
    const ComponentName = () =>{
        return(
            <div>Hello, You have Successfully created Component.</div>
        );
    }
​
    export default ComponentName.js
```

## Routes

````shell
  Path / Url             	HTTP Verb        Path	                       Controller#Action


api_v1_books_path	          GET	       /api/v1/books(.:format)         api/v1/books#index
	                          POST	       /api/v1/books(.:format)         api/v1/books#create

api_v1_book_path              GET	       /api/v1/books/:id(.:format)     api/v1/books#show
                              PATCH	       /api/v1/books/:id(.:format)     api/v1/books#update
                              PUT	      /api/v1/books/:id(.:format)      api/v1/books#update
                              DELETE     /api/v1/books/:id(.:format)       api/v1/books#destroy

api_v1_authenticate_path      POST	     /api/v1/authenticate(.:format)    api/v1/authentication#create
​
​

## API

​
Uses Rest API.

- A `REST API` (also known as RESTful API) is an application programming interface (API or web API) that conforms to the constraints of REST architectural style and allows for interaction with RESTful web services.
  ​

## Models

- `User Model` - Model contain Email and password.
- `Books Model` - Model contain Name image and slug.
- `Author Model` - Model contain Title description and score based on star rating.
  ​

## Migration

```shell
    rails g model Author first_name last_name age

    rails g model Book title author_id author:belongs_to
​
    rails g model User username password_digest
````

```shell
    rails db:migrate
```

## Representers

- Representers help to parse and render documents for JSON or XML APIs.

```shell
    gem 'fast_jsonapi'
```

```shell
    rails g serializer Airline name image_url slug
    rails g serializer Review title description score airline_id
```

## Rubocop

- RuboCop is a Ruby code style checking and code formatting tool.
  ​

```shell
    gem 'rubocop-rails', require: false
```

​

# Configuration

​

## Authentication

JWT gem is used for a compact and self-contained way for securely transmitting information between parties as a JSON object.JSON Web Tokens consist of three parts separated by dots (.), which are:

a) Header
b) Payload
c) Signature
​

### Add jwt gem in Gemfile

```shell
    gem 'jwt'
```

```shell
    bundle install
```

### Install Devise

```shell
    rails g jwt:install
```

### Create Authentication Controller

```shell
    rails generate controllers users
```
