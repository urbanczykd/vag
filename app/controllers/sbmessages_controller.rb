class SbmessagesController < ApplicationController
  def new
    @sbmessage = Sbmessage.new
  end
  
  def create
    @sbmessage = Sbmessage.new(params[:sbmessage])
    respond_to do |format|
      sleep 2
      if @sbmessage.save
          @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
          format.js{ render('create.js', :layout => false)}
      else
        redirect_to root_url
      end
    end
  end
  
end
