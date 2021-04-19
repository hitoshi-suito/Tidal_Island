class TidesController < ApplicationController
  def index
    @tide = Tide.find_closest
    if @tide.opening?
      redirect_to blogs_path
    else
      render :index
    end
  end
end
