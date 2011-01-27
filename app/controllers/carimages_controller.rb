class CarimagesController < ApplicationController

  def create
    @carimage = Carimage.new(params[:carimage])
    if @carimage.save
      @carimage.move_to_top
      redirect_to user_cargallery_path(params[:user_id], params[:cargallery_id])
    else
      redirect_to user_cargallery_path(current_user.username, params[:cargallery_id])
    end
  end  
  
  def destroy
    @carimage = Carimage.find(params[:id])
    @carimage.destroy
    redirect_to user_cargallery_path(current_user.username, params[:cargallery_id])
  end
end
