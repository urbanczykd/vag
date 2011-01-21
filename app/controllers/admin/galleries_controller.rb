class Admin::GalleriesController < AdminController
  def create
    return render :text => "jestem w create Gallery!"
  end
end