class ItemsController < ApplicationController
  before_action :set_room

  def index
    @item = Item.where(room_id: params[:room_id]).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to room_items_path(@room, @item)
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:item).permit(:item_name, :item_memo, :image).merge(user_id: current_user.id, room_id: @room.id)
  end
end
