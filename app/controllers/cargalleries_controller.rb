class CargalleriesController < ApplicationController
  
  def index
    @user_session = UserSession.new
    @cargalleries = Cargallery.all(:conditions => 
    {:user_id => current_user.id})
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
  	@sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
  end
  
  def show
    @cargallery = Cargallery.find(params[:id])
    @user = current_user
    @carimage = Carimage.new
    @carimages = Carimage.all(:conditions => {:user_id => User.find_by_username(params[:user_id])}, :order => "position ASC")
    @user_session = UserSession.new
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
  	@sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
  end
  
  def new
    @user = User.find_by_username(params[:user_id])
    @cargallery = Cargallery.new

    @user_session = UserSession.new
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
  	@sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
  end
  
  def edit
@users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
@sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
@sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
  end
  
  def create
    @cargallery = Cargallery.new(params[:cargallery])
    if @cargallery.save
      redirect_to user_cargalleries_path(params[:user_id])
    else
    end
  end
  
  def update
    @cargallery = Cargallery.find(params[:id])
    if @cargallery.update_attributes(params[:cargallery])
      redirect_to user_cargalleries_path(params[:user_id])  
    else
      redirect_to user_cargalleries_path(params[:user_id])
    end
    
  end 
  
  def destroy
    @cargallery = Cargallery.find(params[:id])
    @cargallery.destroy
    redirect_to user_cargalleries_path(params[:user_id])
  end
end
