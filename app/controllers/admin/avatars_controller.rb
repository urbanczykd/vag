class Admin::AvatarsController < AdminController
  
  def create
    if Avatar.find(:all, :conditions => {:user_id => params[:avatar][:user_id]}).count > 0
#      return render :text => "TAK wiecej niz 1#{params[:avatar][:user_id]}"
            @avatar = Avatar.find(:first, :conditions => {:user_id => params[:avatar][:user_id]})
      if @avatar.update_attributes(params[:avatar])
redirect_to edit_admin_user_path(User.find(params[:avatar][:user_id].to_i).username)
      
      end
  else
      @avatar = Avatar.new(params[:avatar])
      if @avatar.save
        redirect_to edit_admin_user_path(User.find(params[:avatar][:user_id].to_i).username)
      else
        redirect_to edit_admin_user_path(User.find(params[:avatar][:user_id].to_i).username)
      end
    end
  end

  
  
  def update
    return render :text => "Jestem w Update AVATAR! "
  end
  
end
