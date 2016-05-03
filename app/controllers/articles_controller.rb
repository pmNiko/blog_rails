class ArticlesController < ApplicationController
  def index
    flash[:notice] = "This is a notice"
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.save
    redirect_to article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    begin
      @article.update!(article_params)
      redirect_to @article
    rescue ActiveRecord::RecordInvalid
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
