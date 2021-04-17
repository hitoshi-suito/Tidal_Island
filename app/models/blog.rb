class Blog < ApplicationRecord
  belongs_to :tide, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, length: { maximum: 50 }
  validates :content, presence: true
  validates :content, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader

end
