class Tide < ApplicationRecord
  has_many :blogs, dependent: :destroy

  def self.insert_column
    # tide = Tide.create(low_start_at: '0:30', low_end_at: '1:00', current_time: Time.now)
    # tide = Tide.create(low_start_at: '4:00', low_end_at: '4:30', current_time: Time.now)
    # tide = Tide.create(low_start_at: '7:00', low_end_at: '7:30', current_time: Time.now)
    # tide = Tide.create(low_start_at: '12:00', low_end_at: '12:30', current_time: Time.now)
    # tide = Tide.create(low_start_at: '17:00', low_end_at: '17:30', current_time: Time.now)
    # tide = Tide.create(low_start_at: '19:00', low_end_at: '19:30', current_time: Time.now)
    tide = Tide.create(low_start_at: '10:00', low_end_at: '23:00', current_time: Time.now)
  end
end
