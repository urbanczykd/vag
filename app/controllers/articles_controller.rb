class ArticlesController < ApplicationController
  def index
#    return render :text => "#{params.to_yaml}"
    if params[:article]
    @user_session = UserSession.new
    @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
    @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
  	@sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
    else
    @articles = Articles.all(:order => :position)
  
    end
  end
  
  def show
 begin

     @article = Article.find(params[:article])
      rescue ActiveRecord::RecordNotFound
       return render :text => "ops"
     end

     @user_session = UserSession.new
     @users_online = User.find(:all, :order => 'last_request_at DESC', :limit => 10)
     @sbmessages = Sbmessage.all(:order => 'created_at DESC', :limit => 20)
  	 @sbmessagesTOP = Sbmessage.all(:select => 'user_id, count(message) as top', :group => "user_id", :order => "top DESC", :limit => 5)
      
    end      
end
