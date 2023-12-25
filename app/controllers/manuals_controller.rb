class ManualsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
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

  private

  def manual_params
    params.require(:manual).permit(:manual_name, :model_number, :manual_url, :assurance, :manual_date, :price, :manual_memo).merge(user_id: current_user.id, room_id: @room.id)
  end
end
