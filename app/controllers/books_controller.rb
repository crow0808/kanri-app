class BooksController < ApplicationController
  before_action :set_room
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @book = Book.where(room_id: params[:room_id]).order('created_at DESC')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to room_books_path(@room, @book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to room_books_path(@room, @book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to room_books_path(@room, @book)
  end

  def search
    if params[:keyword].present?
      @book = Book.where('book_name LIKE(?)', "%#{params[:keyword]}%")
    else
      @book = Book.where(room_id: params[:room_id]).order('created_at DESC')
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:book_name, :book_number, :release_date, :book_memo, :image).merge(user_id: current_user.id, room_id: @room.id)
  end
end
