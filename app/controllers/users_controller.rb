class UsersController < ApplicationController
  
  def new
    @user = User.new
    @user_session = UserSession.new
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)

  end
  
  def index
    @users = User.all
  end
  
  def show
#    return render :text => "params #{params.to_yaml}"
    @user = User.find_by_username(params[:user_id])
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)

  end
  
  def create
    @user = User.new(params[:user])
    @user.update_attributes(:role_id => "1")
    
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @avatar = Avatar.new
#    return render :text => "#{params[:id].to_yaml}"
    @user = User.find_by_username(params[:id])
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)

  end
  
  def update
    @user = User.find_by_username(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to edit_user_path(params[:id])
    else
      render :action => 'edit'
    end
  end

end
