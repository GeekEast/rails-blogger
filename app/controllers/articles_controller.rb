class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :update]

  def index
    render json: Article.all
  end

  def show
    @article ? (render json: @article) : render_resource_not_found
  end

  def destroy
    @article ? (@article.destroy) : render_resource_not_found
  end

  def create
    # new won't trigger model validation
    # create will trigger model validation
    @article = Article.create(article_params)
    render json: @article.errors
    # if @article.errors
    #   render json: @article, status: :created
    # else
    #   render json: @article.errors, status: :unprocessable_entity
    # end
  end

  def update
    # update will trigger model validation
    @article = Article.update(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find_by_id(params.require(:id))
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
