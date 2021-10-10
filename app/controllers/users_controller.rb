class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # @nickname = user.nickname
    # @animals = user.animals
  end
end
