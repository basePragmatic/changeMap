class MapsController < ApplicationController
  def index
    @maps = Map.all
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)

    if @map.save
      redirect_to maps_path
    end
  end

  private

  def map_params
    params.require(:map).permit(:from_exchange_item, :where_exchange_item)
  end
end
