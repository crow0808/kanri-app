class ManualsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
  end

  def new
  end

  def create
  end
end
