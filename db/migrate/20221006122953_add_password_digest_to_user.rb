# frozen_string_literal: true

# migration to add password digest
class AddPasswordDigestToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
  end
end
