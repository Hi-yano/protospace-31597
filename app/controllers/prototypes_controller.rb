class PrototypesController < ApplicationController

  def index
  end

  def new
    @prototypes = Prototype.new
  end

  def create
    if Prototype.create(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end