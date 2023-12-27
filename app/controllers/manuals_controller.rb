class ManualsController < ApplicationController
  before_action :set_room
  before_action :set_manual, only: [:show, :edit, :update, :destroy]

  def index
    @manual = Manual.where(room_id: params[:room_id]).order('created_at DESC')
  end

  def new
    @manual = Manual.new
  end

  def create
    @manual = Manual.new(manual_params)
    if @manual.save
      redirect_to room_path(@room), notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @manual.update(manual_params)
      redirect_to room_manuals_path(@room, @manual)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @manual.destroy
    redirect_to room_manuals_path(@room, @manual)
  end

  def search
    if params[:keyword].present?
      @manual = Manual.where('manual_name LIKE(?)', "%#{params[:keyword]}%")
    else
      @manual = Manual.where(room_id: params[:room_id]).order('created_at DESC')
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_manual
    @manual = Manual.find(params[:id])
  end

  def manual_params
    params.require(:manual).permit(:manual_name, :model_number, :manual_url, :assurance, :manual_date, :price, :manual_memo, :image).merge(user_id: current_user.id, room_id: @room.id)
  end
end
