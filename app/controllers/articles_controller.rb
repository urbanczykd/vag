class ArticlesController < ApplicationController
  def index
    @articles = Articles.all(:order => :position)
  end
end
