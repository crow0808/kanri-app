class ManualsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
  end

  def new
    @room = Room.find(params[:room_id])
    @manual = Manual.new
  end

  def create
  end
end
