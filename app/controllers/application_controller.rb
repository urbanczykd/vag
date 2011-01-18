class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  
    def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
# cache
  def expire_root
        expire_page "/"
  end

  def expire_article_show # some problems with this :/
    Rails.cache.clear
  end
  
  def expire_all
    Dir.chdir(RAILS_ROOT+"/public/")
    Dir.glob("*-*.html").each do |file|
     File.delete(file)
    end
  end
  
  def expire_one(id)
    if File.exist?(id+".html")
       Dir.chdir(RAILS_ROOT+"/public/")
       File.delete(id+".html")
    end
  end

  
end
