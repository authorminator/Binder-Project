class BookclubController < ApplicationController
  def index
    @bookclubs = Bookclub.all
  end

  def show
    @bookclub = Bookclub.find(params[:id])
  end

  def create
    @bookclub = Bookclub.new(bookclub_params)
    if @bookclub.save
      render json: { message: 'Bookclub was successfully created.', bookclub: @bookclub }, status: :created
    else
      render json: { errors: @bookclub.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @bookclub = Bookclub.find(params[:id])
    if @bookclub.update(bookclub_params)
      render json: { message: 'Bookclub was successfully updated.', bookclub: @bookclub }, status: :ok
    else
      render json: { errors: @bookclub.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @bookclub = Bookclub.find(params[:id])
    if @bookclub.destroy
      render json: { message: 'Bookclub was successfully deleted.' }, status: :ok
    else
      render json: { errors: @bookclub.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def bookclub_params
    params.require(:bookclub).permit(:name)
  end
end
