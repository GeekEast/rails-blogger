class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_article, only: [:show, :destroy, :update]

  def index
    render json: @user.articles
  end

  def show
    @article ? (render json: @article) : render_resource_not_found
  end

  def destroy
    @article ? (render json: @article.destroy) : render_resource_not_found
  end

  def create
    # new won't trigger model validation
    # create will trigger model validation
    @article = Article.create(article_params)
    if @article.errors.empty?
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    # update will trigger model validation
    if @article
      @article.update(article_params)
      if @article.errors.empty?
        render json: @article, status: :ok
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    else
      render json: { artile: ["Article Not found"] }, status: :not_found
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_article
    @article = @user.articles.find_by_id(params.require(:id))
  end

  def article_params
    params.require(:article).permit(:title, :body).merge({ user_id: @user.id })
  end
end
