class ShelvesController < ApplicationController
  # Turn off CRSF token ( when API use only )
  skip_before_action :verify_authenticity_token

  # [Temporarily] skip authenticate_user!
  skip_before_action :authenticate_user!, only: [:create, :update]


  def index
    @shelves = Shelf.all
    render json: @shelves
  end

  def show
    @shelf = Shelf.find(params[:id])
    @profile = @shelf.profile
    render json: @profile
  end

  def create
    @shelf = Shelf.new(shelf_params)
    if @shelf.save
      render json: { message: 'Shelf was successfully created.', shelf: @shelf }, status: :created
    else
      render json: { errors: @shelf.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @shelf = Shelf.find(params[:id])
    if @shelf.update(shelf_params)
      render json: { message: 'Shelf was successfully updated.', shelf: @shelf }, status: :ok
    else
      render json: { errors: @shelf.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @shelf = Shelf.find(params[:id])
    if @shelf.destroy
      render json: { message: 'Shelf was successfully deleted.' }, status: :ok
    else
      render json: { errors: @shelf.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def shelf_params
    params.require(:shelf).permit(:title, :description, :profile_id)
  end
end
