class TidesController < ApplicationController
  def index
    @tide = Tide.insert_column
    low_start = @tide.low_start_at
    low_end = @tide.low_end_at
    current_time = @tide.current_time

    if low_start < current_time && current_time < low_end
      redirect_to blogs_path
    else
      render :index
    end
  end
end
