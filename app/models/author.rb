# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }
  validates :age, presence: true
end
