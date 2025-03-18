class Author < ApplicationRecord
  include ActiveModel::Validations

  has_many :writing_outlets




end
