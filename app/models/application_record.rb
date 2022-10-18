# frozen_string_literal: true

# ApplicationRecord in model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
