# frozen_string_literal: true

# migration for adding authors to books
class AddAuthorToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :author
  end
end
