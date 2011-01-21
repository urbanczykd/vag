class Admin::ImagesController < AdminController
  def create
    if !params[:image][:article_id].empty?
      
        @image = Image.new(params[:image])
        respond_to do |format|
          if @image.save
            format.html {redirect_to edit_admin_article_path(params[:image][:article_id])}            
          else
            # jeżeli został przekazany pusty article_id
            format.html {redirect_to admin_articles_path}
          end
        end
    end
  end
end