class Admin::SbmessagesController < AdminController
  def index
    @sbmessages = Sbmessage.all.paginate(:per_page => 10, :page => params[:page])

  end
  def new
    @sbmessage = Sbmessage.new
  end
  def edit 
    @sbmessage = Sbmessage.find(params[:id])
  end 
  def create
    @sbmessage = Sbmessage.new(params[:sbmessage])
    if @sbmessage.save
      flash[:notice] = "Message add."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  def update
    @sbmessage = Sbmessage.find(params[:id])
    if @sbmessage.update_attributes(params[:sbmessage])
      redirect_to admin_sbmessages_path
    else
      redirect_to admin_sbmessages_path
    end
  end
  def destroy
    @sbmessage = Sbmessage.find(params[:id])
    @sbmessage.destroy
    redirect_to admin_sbmessages_path
  end
  
end
