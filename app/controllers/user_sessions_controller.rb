class UserSessionsController < ApplicationController


  def new
    @user_session = UserSession.new
    
  end
  
  def create
        @user_session = UserSession.new(params[:user_session])
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
  	@sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)

        if @user_session.save
          redirect_to root_path
        elsif
          render :action => 'new'
        end
  end
  
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end



end
