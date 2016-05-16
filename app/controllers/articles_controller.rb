class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @articles = Article
    .all
    .limit(10)
    .order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def send_error
    flash.now[:error] = @article.errors.full_messages.to_sentence
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user

    begin
      @article.save!
      redirect_to article
    rescue ActiveRecord::RecordInvalid
      send_error
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    authorize @article

    begin
      @article.update!(article_params)
      redirect_to @article
    rescue ActiveRecord::RecordInvalid
      send_error
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article

    @article.destroy
    redirect_to articles_path
  end


  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
