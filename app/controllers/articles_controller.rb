class ArticlesController < ApplicationController
  def index
    @articles = current_user.articles
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def without_news
    flash[:notice] = ''
  end

  def send_error
    if @article.errors.any?
      messages_error = '<div id="error_explanation"> ' \
                       '<h2>' + @article.errors.count.to_s +
                       ' error(s) prohibited this article from beign saved:' '</h2><ul>'

      @article.errors.full_messages.each do |msg|
        messages_error = messages_error + '<li>' + msg + '</li>'
      end
      messages_error + '</ul></div>'
      flash[:notice] = messages_error.html_safe
    end
  end

  def create
    article = Article.new(article_params)
    article.author = current_user

    begin
      article.save!
      without_news
      redirect_to article
    rescue ActiveRecord::RecordInvalid
      send_error
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    begin
      @article.update!(article_params)
      without_news
      redirect_to @article
    rescue ActiveRecord::RecordInvalid
      send_error
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
