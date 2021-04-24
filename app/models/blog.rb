class Blog < ApplicationRecord
  belongs_to :tide
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader
end
