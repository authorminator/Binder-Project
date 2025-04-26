class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @shelfs = @profile.shelfs
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      render json: { message: 'Profile was successfully updated.', profile: @profile }, status: :ok
    else
      render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    # Only allow a list of trusted parameters through.
  end
end
