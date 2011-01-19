class Admin::ArticlesController < AdminController
  def index
    @articles = Article.all(:order => :position)
  end
  def new
    @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])
  end
  def create
    @article = Article.new(params[:article])
    if @article.save
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
end
