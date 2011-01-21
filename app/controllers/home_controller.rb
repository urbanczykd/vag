class HomeController < ApplicationController

  def index
    @articles = Article.all(:order => :position, :conditions =>{:publish => true}).paginate(:per_page => 5, :page => params[:page])
    @user_session = UserSession.new
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
  	@sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)

  end
  
end
