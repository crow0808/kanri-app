class ItemsController < ApplicationController
  before_action :set_room
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    if @item.update(item_params)
      redirect_to room_items_path(@room, @item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to room_items_path(@room, @item)
  end

  def search
    if params[:keyword].present?
      @item = Item.where('item_name LIKE(?)', "%#{params[:keyword]}%")
    else
      @item = Item.where(room_id: params[:room_id]).order('created_at DESC')
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :item_memo, :image).merge(user_id: current_user.id, room_id: @room.id)
  end
end
