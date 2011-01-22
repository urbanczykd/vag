class CommentsController < ApplicationController
  
  def create
        @comment = Comment.new(params[:comment])
        respond_to do |format|    
          if !params[:comment][:body].empty?
            if @comment.save
              format.html {redirect_to article_path(params[:article_id])}
            else
              format.html {redirect_to article_path(params[:article_id]) }
            end
          else
            format.html {redirect_to article_path(params[:article_id])}
          end
        end
  end

end
