class Admin::UsersController < AdminController
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by_username(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find_by_username(params[:id])
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

end
