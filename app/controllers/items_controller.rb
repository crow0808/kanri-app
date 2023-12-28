class ItemsController < ApplicationController
  before_action :set_room

  def index
    @item = Item.where(room_id: params[:room_id]).order('created_at DESC')
  end

  def new
  end

  def create

  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_item
  end

  def item_params
  end
end
