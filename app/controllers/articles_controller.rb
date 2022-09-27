class ArticlesController < ApplicationController
  include Paginable
  skip_before_action :authorize!, only: %i[index show]

  def index
    paginated = paginate(Article.recent)
    render_collection(paginated)
  end

  def show
    article = Article.find(params[:id])
    render json: serializer.new(article)
  end

  def create
    article = Article.new(article_params)
    if(article.valid?)
      #to do
    else
      render json: article, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer,
             status: :unprocessable_entity
    end
  end

  def serializer
    ArticleSerializer
  end

  private

  def article_params
    ActionController::Parameters.new
  end
end
