class OwnedBooksController < ApplicationController
  before_action :set_owned_book, only: [:show, :update, :destroy]

  def index
    @owned_books = current_user.owned_books.includes(:book)
    render json: @owned_books, includes: :book
  end

  def show
    render json: @owned_book, include: :book
  end

  def create
    @owned_book = current_user.owned_books.new(owned_book_params)

    if @owned_book.save
      render json: @owned_book, status: :created, include: :book
    else
      render json: { errors: @owned_book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if ownned_book.user != current_user
      render json: { error: "You are not authorized to update this owned book." }, status: :unauthorized
      return
    end

    if @owned_book.update(owned_book_params)
      render json: @owned_book, include: :book
    else
      render json: { errors: @owned_book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @owned_book.user != current_user
      render json: { error: "You are not authorized to delete this owned book." }, status: :unauthorized
      return
    end

    @owned_book.destroy
    head :no_content
  end

  private

  def set_owned_book
    @owned_book = OwnedBook.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "OwnedBook not found" }, status: :not_found
  end

  def owned_book_params
    params.require(:owned_book).permit(:book_id, :rating)
  end

end
