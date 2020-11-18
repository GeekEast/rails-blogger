class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]

  def index
    render json: Article.all
  end

  def show
    render json: @article
  end

  def destroy
    @article.destroy
    # render json: { message: "removed" }, status: :ok
    head :no_content
  end

  def create
  end

  def edit
  end

  private

  def set_article
    @article = Article.find(params.require(:id))
  end
end
