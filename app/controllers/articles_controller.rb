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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params) 
      redirect_to @article
    else 
      render :edit, status: unprocessable_entity
    end
  end

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  # Extract title and body from body (built-in feature form of Rails), this is post method
  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
