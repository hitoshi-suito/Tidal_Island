class TidesController < ApplicationController
# before_action :destroy, only: [:index]
  def index
    @tide = Tide.find_closest
    if @tide.opening?
      redirect_to blogs_path
    else
      render :index
    end
  end
end
