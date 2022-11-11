# frozen_string_literal: true

module Api
  module V1
    # this is books controller
    class BooksController < ApplicationController
      before_action :authenticate_user, only: %i[create destroy update]

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

      # DELETE /api/v1/books/:id
      def destroy
        Book.find(params[:id]).destroy!

        head :no_content
      end

      private

      def book_params
        params.require(:book).permit(:title, :author_id)
      end
    end
  end
end
