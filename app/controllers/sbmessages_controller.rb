class SbmessagesController < ApplicationController
  def new
    @sbmessage = Sbmessage.new
  end
  
  def create
    @sbmessage = Sbmessage.new(params[:sbmessage])
    respond_to do |format|
      if @sbmessage.save
        flash[:notice] = "Message add."
          format.js{ render('create.js', :layout => false)}
      else
        redirect_to root_url
      end
    end
  end
  
end
