class LikesController < ApplicationController

  before_action :authenticate_user!
  
  def create
    @like = Like.new(user_id: current_user.id, animal_id: params[:animal_id])
    @like.save
    redirect_to("/animals/#{params[:animal_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, animal_id: params[:animal_id])
    @like.destroy
    redirect_to("/animals/#{params[:animal_id]}")
  end
  
end