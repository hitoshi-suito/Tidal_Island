class Blog < ApplicationRecord
  validates :title, length: { maximum: 50 }
  validates :content, presence: true
  validates :content, length: { maximum: 1000 }
end
