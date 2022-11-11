# frozen_string_literal: true

module Api
  module V1
    # This is authors controller
    class AuthorsController < ApplicationController
      # Get /api/v1/authors

      before_action :authenticate_user, only: %i[create destroy update]

      def create
        author = Author.new(author_params)
        if author.save
          render json: author, status: :created
        else
          render json: author.errors, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/authors
      def update
        author = Author.find(params[:id])
        if author.update(author_params)
          render json: author, status: :created
        else
          render json: author.errors, status: :unprocessable_entity
        end
      end

      # Get /api/v1/author_index
      def index
        authors = Author.all

        render json: authors, include: ['books']
      end

      # Get /api/v1/author_show/:id
      def show
        author = Author.find(params[:id])

        render json: author.to_json(only: %i[first_name last_name age],
                                    include: [books: { only: [:title] }])
      end

      # DELETE /api/v1/author_destroy/:id
      def destroy
        Author.find(params[:id]).destroy

        head :no_content
      end

      private

      def author_params
        params.require(:author).permit(:first_name, :last_name, :age)
      end
    end
  end
end
