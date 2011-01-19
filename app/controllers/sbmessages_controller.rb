class SbmessagesController < ApplicationController
  def new
    @sbmessage = Sbmessage.new
  end
  
  def create
    @sbmessage = Sbmessage.new(params[:sbmessage])
    if @sbmessage.save
      flash[:notice] = "Message add."
      redirect_to root_url
    else
      redirect_to root_url
    end
  end
  
end
