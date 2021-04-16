class Tide < ApplicationRecord
  def self.insert_column
    tide = Tide.create(low_start_at: '23:00', low_end_at: '23:30', current_time: Time.now)
    binding.pry
    if tide.low_start_at > current_time
      redirect_to blogs_path
    end
  end
end
