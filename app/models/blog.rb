class Blog < ApplicationRecord
  belongs_to :tide
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, length: { maximum: 50 }
  validates :content, presence: true
  validates :content, length: { maximum: 1000 }

  mount_uploader :image, ImageUploader

  # def create_test_tide
  #   Tide.create(low_start_hour: 0,
  #               low_start_min: 0,
  #               low_end_hour: 23,
  #               low_end_min: 59,
  #               year: Time.now.year,
  #               month: Time.now.month,
  #               day: Time.now.day
  #   )
  # end
end

# def validates(method_name, length: 0, ...)

# end
