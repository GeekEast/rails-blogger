class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]
  rescue_from NoMethodError, with: :article_not_found_error

  def index
    render json: Article.all
  end

  def show
    render json: @article
  end

  def destroy
    @article.destroy
  end

  def create
  end

  def edit
  end

  private

  def set_article
    @article = Article.find_by_id(params.require(:id))
  end

  def article_not_found_error
    head :not_found
  end
end
