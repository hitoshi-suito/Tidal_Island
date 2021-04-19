class Tide < ApplicationRecord
  has_many :blogs, dependent: :destroy

  def low_start_at
    Time.mktime(self.year, self.month, self.day, self.low_start_hour, self.low_start_min)
  end

  def low_end_at
    Time.mktime(self.year, self.month, self.day, self.low_end_hour, self.low_end_min)
  end

  def started?
    Time.now >= self.low_start_at
  end

  def opening?
    self.started? && self.unfinished?
  end

  def finished?
    Time.now >= self.low_end_at
  end

  def unfinished?
    !self.finished?
  end

  def self.today_params
    now = Time.now
    return { year: now.year, month: now.month, day: now.day }
  end

  def self.find_closest
    tides = self.refresh_and_find_todays
    unfinisheds = tides.select(&:unfinished?)
    return unfinisheds.first
  end

  def self.refresh_and_find_todays
    tides = [
      Tide.find_by(
        today_params.merge(
          low_start_hour: 0,
          low_start_min: 30,
          low_end_hour: 1,
          low_end_min: 0
        )
      ) || Tide.create(
        today_params.merge(
          low_start_hour: 0,
          low_start_min: 30,
          low_end_hour: 1,
          low_end_min: 0
        )
      ),
      Tide.find_by(
        today_params.merge(
          low_start_hour: 4,
          low_start_min: 0,
          low_end_hour: 4,
          low_end_min: 30
        )
      ) || Tide.create(
        today_params.merge(
          low_start_hour: 4,
          low_start_min: 0,
          low_end_hour: 4,
          low_end_min: 30
        )
      ),
      Tide.find_by(
        today_params.merge(
          low_start_hour: 7,
          low_start_min: 0,
          low_end_hour: 7,
          low_end_min: 30
        )
      ) || Tide.create(
        today_params.merge(
          low_start_hour: 7,
          low_start_min: 0,
          low_end_hour: 7,
          low_end_min: 30
        )
      ),
      Tide.find_by(
        today_params.merge(
          low_start_hour: 12,
          low_start_min: 0,
          low_end_hour: 12,
          low_end_min: 30
        )
      ) || Tide.create(
        today_params.merge(
          low_start_hour: 12,
          low_start_min: 0,
          low_end_hour: 12,
          low_end_min: 30
        )
      ),
      Tide.find_by(
        today_params.merge(
          low_start_hour: 17,
          low_start_min: 0,
          low_end_hour: 17,
          low_end_min: 30
        )
      ) || Tide.create(
        today_params.merge(
          low_start_hour: 17,
          low_start_min: 0,
          low_end_hour: 17,
          low_end_min: 30
        )
      ),
      Tide.find_by(
        today_params.merge(
          low_start_hour: 19,
          low_start_min: 0,
          low_end_hour: 19,
          low_end_min: 30
        )
      ) || Tide.create(
        today_params.merge(
          low_start_hour: 19,
          low_start_min: 0,
          low_end_hour: 19,
          low_end_min: 30
        )
      )
    ]
    return tides
  end
# binding.pry
  

  

  # def self.admin_insert_column
  #   tide = Tide.create(low_start_at: '0:00', low_end_at: '23:59', current_time: Time.now)
  # end
end
