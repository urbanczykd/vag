class ArticlesController < ApplicationController
  def index
    @articles = Articles.all(:order => :position)
  end
  
  def show
#    @article = Article.find(params[:id])
    @user_session = UserSession.new
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
  	@sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
  end
end
