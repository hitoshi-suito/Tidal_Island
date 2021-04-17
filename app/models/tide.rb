class Tide < ApplicationRecord
  def self.insert_column
    tide = Tide.create(low_start_at: '18:00', low_end_at: '23:30', current_time: Time.now)
  end
end
