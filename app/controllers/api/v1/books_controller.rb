# frozen_string_literal: true

module Api
  module V1
    # this is books controller
    class BooksController < ApplicationController
      include ActionController::HttpAuthentication::Token

      before_action :authenticate_user, only: %i[create destroy]

      # GET /api/v1/books
      def index
        books = Book.all

        render json: BooksRepresenter.new(books).as_json
      end

      # POST /api/v1/books
      def create
        # author = Author.create!(author_params)
        # book = Book.new(book_params.merge(author_id: author.id))
        book = Book.new(book_params)

        if book.save
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      # Get /api/v1/books
      def show
        book = Book.find(params[:id])
        render json: BookRepresenter.new(book).as_json
      end

      # PUT /api/v1/books
      def update
        book = Book.find(params[:id])

        if book.update(book_params)
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      # Get /api/v1/authors
      def author_create
        author = Author.new(author_params)
        if author.save
          render json:  author, status: :created
        else
          render json:  author.errors, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/authors
      def author_update
        author = Author.find(params[:id])
        if author.update(author_params)
          render json: author, status: :created
        else
          render json: author.errors, status: :unprocessable_entity
        end
      end

      # Get /api/v1/author_index
      def author_index
        authors = Author.all

        render json: authors, include: ['books']
      end

      # Get /api/v1/author_show/:id
      def author_show
        author = Author.find(params[:id])

        render json: author.to_json(only: %i[first_name last_name age],
                                    include: [books: { only: [:title] }])
      end

      # DELETE /api/v1/author_destroy/:id
      def author_destroy
        Author.find(params[:id]).destroy

        head :no_content
      end

      # DELETE /api/v1/books/:id
      def destroy
        Book.find(params[:id]).destroy!

        head :no_content
      end

      private

      def authenticate_user
        token, _options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)
        User.find(user_id)
      rescue ActiveRecord::RecordNotFound, JWT::DecodeError
        render status: :unauthorized
      end

      def author_params
        params.require(:author).permit(:first_name, :last_name, :age)
      end

      def book_params
        params.require(:book).permit(:title, :author_id)
      end
    end
  end
end
