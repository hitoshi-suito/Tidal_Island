class Tide < ApplicationRecord
  has_many :blogs, dependent: :destroy

  def low_start_at # tides#index訪問時の、メソッドrefresh_and_find_todaysによる、tide開始時刻のインスタンス化
    Time.mktime(self.year, self.month, self.day, self.low_start_hour, self.low_start_min)
  end

  def low_end_at # tides#index訪問時の時刻をインスタンス化
    Time.mktime(self.year, self.month, self.day, self.low_end_hour, self.low_end_min)
  end

  def started? #現在時刻が、ログイン可能時刻にあるかどうかの確認
    Time.now >= self.low_start_at
  end

  def opening? #ログイン可能時間中かの確認
    self.started? && self.unfinished?
    # binding.pry
  end

  def finished? #現在時刻が、ログイン終了時刻を過ぎているかどうかの確認
    Time.now >= self.low_end_at
  end

  def unfinished? #ログイン時刻が終了していないことの確認
    !self.finished?
  end

  class << self

    def today_params #現在の年月日
      now = Time.now
      return { year: now.year, month: now.month, day: now.day }
    end

    def find_closest #全ての指定時間帯(tides)からまだ終わっていない時間帯のものを取り出し、その上で直近のものを抽出する
      tides = self.refresh_and_find_todays
      unfinisheds = tides.select(&:unfinished?)
      return unfinisheds.first
      # binding.pry
    end

    def refresh_and_find_todays #インスタンス作成済みの指定時間帯のtideを探し、作成されていなければその指定時間帯のインスタンスを作成する
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
        ),
        # Tide.find_by(
        #   today_params.merge(
        #     low_start_hour: 10,
        #     low_start_min: 8,
        #     low_end_hour: 22,
        #     low_end_min: 15
        #   )
        # ) || Tide.create(
        #   today_params.merge(
        #     low_start_hour: 10,
        #     low_start_min: 8,
        #     low_end_hour: 22,
        #     low_end_min: 15
        #   )
        # ),
        Tide.find_by(
          today_params.merge(
            low_start_hour: 23,
            low_start_min: 59,
            low_start_second: 58,
            low_end_hour: 23,
            low_end_min: 59,
            low_end_second: 59
          )
        ) || Tide.create(
          today_params.merge(
            low_start_hour: 23,
            low_start_min: 59,
            low_start_second: 58,
            low_end_hour: 23,
            low_end_min: 59,
            low_end_second: 59
          )
        )
      ]
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