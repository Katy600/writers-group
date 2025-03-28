class Author < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :writing_outlets, dependent: :destroy
end
