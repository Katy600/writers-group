class WritingOutlet < ApplicationRecord
  belongs_to :author # Corrected association

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
end