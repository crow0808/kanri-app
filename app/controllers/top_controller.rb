class TopController < ApplicationController
  def index
  end

  def join
    @room = Room.find_by(room_name: params[:room_name], room_password: params[:room_password])
    if @room.present?
      current_user.rooms << @room
      redirect_to @room, notice: 'ルームに参加しました'
    else
      flash[:alert] = 'ルーム名またはパスワードが一致しません'
      render :index, status: :unprocessable_entity
    end
  end
end
