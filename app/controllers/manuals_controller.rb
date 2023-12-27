class ManualsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @manual = Manual.where(room_id: params[:room_id]).order('created_at DESC')
  end

  def new
    @room = Room.find(params[:room_id])
    @manual = Manual.new
  end

  def create
    @room = Room.find(params[:room_id])
    @manual = Manual.new(manual_params)
    if @manual.save
      redirect_to room_path(@room), notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:room_id])
    @manual = Manual.find(params[:id])
  end

  def edit
    @room = Room.find(params[:room_id])
    @manual = Manual.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @manual = Manual.find(params[:id])
    if @manual.update(manual_params)
      redirect_to room_manuals_path(@room, @manual)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @manual = Manual.find(params[:id])
    @manual.destroy
    redirect_to room_manuals_path(@room, @manual)
  end

  private

  def manual_params
    params.require(:manual).permit(:manual_name, :model_number, :manual_url, :assurance, :manual_date, :price, :manual_memo, :image).merge(user_id: current_user.id, room_id: @room.id)
  end
end
