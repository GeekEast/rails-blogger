class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]

  def index
    render json: Article.all
  end

  def show
    render json: @article
  end

  def destroy
    @article ? @article.destroy : render_resource_not_found
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
