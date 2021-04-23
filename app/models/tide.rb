class Tide < ApplicationRecord
  has_many :blogs, dependent: :destroy

  def low_start_at
    Time.mktime(self.year, self.month, self.day, self.low_start_hour, self.low_start_min)
  end

  def low_end_at
    Time.mktime(self.year, self.month, self.day, self.low_end_hour, self.low_end_min)
  end

  def started? # Tide時間が開始しているか確認
    Time.now >= self.low_start_at
  end

  def opening? # Tide時間であるかの確認
    self.started? && self.unfinished?
  end

  def finished? # Tide時間が過ぎている
    Time.now >= self.low_end_at
  end

  def unfinished? # Tide時間が過ぎていない確認
    !self.finished?
  end

  class << self

    def today_params
      now = Time.now
      return { year: now.year, month: now.month, day: now.day }
    end

    def find_closest
      tides = self.refresh_and_find_todays
      unfinisheds = tides.select(&:unfinished?)
      return unfinisheds.first
    end

    def refresh_and_find_todays
      tides = [
        # Tide.find_by(
        #   today_params.merge(
        #     low_start_hour: 0,
        #     low_start_min: 30,
        #     low_end_hour: 1,
        #     low_end_min: 0
        #   )
        # ) || Tide.create(
        #   today_params.merge(
        #     low_start_hour: 0,
        #     low_start_min: 30,
        #     low_end_hour: 1,
        #     low_end_min: 0
        #   )
        # ),
        # Tide.find_by(
        #   today_params.merge(
        #     low_start_hour: 4,
        #     low_start_min: 0,
        #     low_end_hour: 4,
        #     low_end_min: 30
        #   )
        # ) || Tide.create(
        #   today_params.merge(
        #     low_start_hour: 4,
        #     low_start_min: 0,
        #     low_end_hour: 4,
        #     low_end_min: 30
        #   )
        # ),
        # Tide.find_by(
        #   today_params.merge(
        #     low_start_hour: 7,
        #     low_start_min: 0,
        #     low_end_hour: 7,
        #     low_end_min: 30
        #   )
        # ) || Tide.create(
        #   today_params.merge(
        #     low_start_hour: 7,
        #     low_start_min: 0,
        #     low_end_hour: 7,
        #     low_end_min: 30
        #   )
        # ),
        # Tide.find_by(
        #   today_params.merge(
        #     low_start_hour: 12,
        #     low_start_min: 0,
        #     low_end_hour: 12,
        #     low_end_min: 30
        #   )
        # ) || Tide.create(
        #   today_params.merge(
        #     low_start_hour: 12,
        #     low_start_min: 0,
        #     low_end_hour: 12,
        #     low_end_min: 30
        #   )
        # ),
        # Tide.find_by(
        #   today_params.merge(
        #     low_start_hour: 17,
        #     low_start_min: 0,
        #     low_end_hour: 17,
        #     low_end_min: 30
        #   )
        # ) || Tide.create(
        #   today_params.merge(
        #     low_start_hour: 17,
        #     low_start_min: 0,
        #     low_end_hour: 17,
        #     low_end_min: 30
        #   )
        # ),
        # Tide.find_by(
        #   today_params.merge(
        #     low_start_hour: 19,
        #     low_start_min: 0,
        #     low_end_hour: 19,
        #     low_end_min: 30
        #   )
        # ) || Tide.create(
        #   today_params.merge(
        #     low_start_hour: 19,
        #     low_start_min: 0,
        #     low_end_hour: 19,
        #     low_end_min: 30
        #   )
        # )
        Tide.find_by(
          today_params.merge(
            low_start_hour: 7,
            low_start_min: 0,
            low_end_hour: 23,
            low_end_min: 50
          )
        ) || Tide.create(
          today_params.merge(
            low_start_hour: 7,
            low_start_min: 0,
            low_end_hour: 23,
            low_end_min: 50
          )
        )
    ] #if !Rails.env.test?

      # test_tides = [
      #   Tide.find_by(
      #     today_params.merge(
      #       low_start_hour: 7,
      #       low_start_min: 0,
      #       low_end_hour: 12,
      #       low_end_min: 30
      #     )
      #   ) || Tide.create(
      #         today_params.merge(
      #           low_start_hour: 7,
      #           low_start_min: 0,
      #           low_end_hour: 12,
      #           low_end_min: 30
      #         )
      #       ),
      #       Tide.find_by(
      #         today_params.merge(
      #           low_start_hour: 12,
      #           low_start_min: 30,
      #           low_end_hour: 23,
      #           low_end_min: 30
      #         )
      #       ) || Tide.create(
      #              today_params.merge(
      #               low_start_hour: 12,
      #               low_start_min: 30,
      #               low_end_hour: 23,
      #               low_end_min: 30
      #              )
      #           )
      # ] if Rails.env.test?
    end
  end
end

# Tide.find_closest
# @tide = Tide.all.first
# @tide.low_end_at

# tides.each do |t|
# end

# ts = tides.each { |t|  } #=> nil
# ts = tides.map { |t| t.low_end_hour } #=> [0, 4, 7, 12, 17, 22 ...]
# ts = tides.select { |t| t.unfinisheds? } #=> [#<Tide low_end_hour=22>]

# ts = tides.map(&:low_end_hour) #=> [0, 4, 7, 12, 17, 22 ...]
# ts = tides.select(&:unfinisheds?) #=> [#<Tide low_end_hour=22>]

# { year: 111, month: 222 }

# User :image :name

# User.image
# User[:image]

# class Hash
#   def merge(**hash)
#     hash.each do |key, value|
#       self[key] = value
#     end
#     return self
#   end
# end

# { a: 11 }.merge(b: 'aaaa') #=> { a: 11, b: 'aaaa' }
# { a: 11 }[:b] = 'aaaa' #=> { a: 11, b: 'aaaa' }