class BookclubsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # for postman
  skip_before_action :authenticate_user!

  def index
    @bookclubs = Bookclub.all
    render json: @bookclubs
  end

  def show
    @bookclub = Bookclub.find(params[:id])
    render json: @bookclub
  end

  def create
    ActiveRecord::Base.transaction do
      @bookclub = current_user.created_bookclubs.new(bookclub_params)
      @bookclub.save!
      Member.create!(bookclub: @bookclub, user: current_user)
    end
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
    params.require(:bookclub).permit(:name, :description)
  end
end
