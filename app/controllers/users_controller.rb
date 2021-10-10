class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # @nickname = user.nickname
    # @animals = user.animals
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :phone_number, :last_name, :first_name, :age, :job, :prefecturre, :profile)
  end

end
