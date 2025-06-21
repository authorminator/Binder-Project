class ShelvesController < ApplicationController
  # Turn off CRSF token ( when API use only )
  skip_before_action :verify_authenticity_token

  # [Temporarily] skip authenticate_user! to use postman
  skip_before_action :authenticate_user!

  def index
    @profile = Profile.find(params[:profile_id])
    @shelves = @profile.shelves
    render json: @shelves
  end

  def show
    @profile = Profile.find(params[:profile_id])
    @shelf = @profile.shelves.find(params[:id])
    render json: @shelf
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @shelf = @profile.shelves.new(shelf_params)
    if @shelf.save
      render json: { message: 'Shelf was successfully created.', shelf: @shelf }, status: :created
    else
      render json: { errors: @shelf.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @shelf = @profile.shelves.find(params[:id])
    if @shelf.update(shelf_params)
      render json: { message: 'Shelf was successfully updated.', shelf: @shelf }, status: :ok
    else
      render json: { errors: @shelf.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    @shelf = @profile.shelves.find(params[:id])
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
