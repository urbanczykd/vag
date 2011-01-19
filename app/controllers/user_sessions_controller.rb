class UserSessionsController < ApplicationController


  def new
    @user_session = UserSession.new
    
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
      if @user_session.save
          redirect_to root_path
        elsif
        render :action => 'new'
      end
  end
  
  def destroy
#    return render :text => "params => #{params.to_yaml}"
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end



end
