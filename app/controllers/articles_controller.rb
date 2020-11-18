class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]

  def index
    render json: Article.all
  end

  def show
    return @article ? (render json: @article) : render_resource_not_found
  end

  def destroy
    return @article ? (@article.destroy) : render_resource_not_found
  end

  def create
  end

  def edit
  end

  private

  def set_article
    @article = Article.find_by_id(params.require(:id))
  end
end
