class AnimalsController < ApplicationController
  def index
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to root_path
    else
      render :new
    end
  end
end


private

  def animal_params
    params.require(:animal).permit(:name, :charm_point, :genre, :gender, :birthday, :age, :prefecture, :image).merge(user_id: current_user.id)
  end