class Admin::ArticlesController < AdminController
  def index
    @articles = Article.all(:order => :position)
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])
    @image = Image.new
    @images = Image.all(:conditions => {:article_id => params[:id]})
  end
  def create
    @article = Article.new(params[:article])
    if @article.save
       @article.move_to_top
      redirect_to admin_articles_path
    else
      redirect_to admin_articles_path
    end
  end
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to admin_articles_path
    else
      redirect_to admin_articles_path
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end
  ##
  def act 
    @article = Article.find(params[:article_id])
    if (params[:art_act] == "true" || params[:art_act] == "false")
      respond_to do |format|
          if @article.update_attributes(:publish => params[:art_act])
            format.html {redirect_to(admin_articles_url)}        
          else
            format.html {redirect_to(admin_articles_url)}
          end
        end 
    elsif params[:art_act] == "up"
      respond_to do |format|
          if @article.move_higher
            format.html {redirect_to(admin_articles_url)}
          else
            format.html {redirect_to(admin_articles_url)}
          end
      end
    elsif params[:art_act] == "down"
      respond_to do |format|
          if @article.move_lower
            format.html {redirect_to(admin_articles_url)}
          else
            format.html {redirect_to(admin_articles_url)}
          end
      end
    end
  end

  ##
end
