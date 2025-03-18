class WritingOutlet < ApplicationRecord
  include ActiveModel::Dirty
  has_one user

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
end
