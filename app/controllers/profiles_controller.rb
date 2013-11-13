class ProfilesController < ApplicationController
  # load_and_authorize_resource

  def index
    @users = User.all
    @profiles = Profile.all
  end

  def new
    @profile = current_user.build_profile
    @user = current_user
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to products_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
    @reviews = @user.reviews
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update
    @user = User.find(params[:user_id])

    if @user.profile.update_attributes(profile_params)
      redirect_to show_user_profile_path(@user)
    else
      render edit_user_profile_path(@user)
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :favorite_fruit, :biography, :user_id, :url)  
  end
end
