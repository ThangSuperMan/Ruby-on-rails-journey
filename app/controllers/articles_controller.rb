class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  # Post method /articles
  def create
    # @article = Article.new(title: '...', body: '...')
    @article = Article.new(article_params)

    # If the condition does not match the full_messages_for will store error message
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
