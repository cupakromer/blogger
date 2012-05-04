class ArticlesController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find params[:id]

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
#    Option 1
#    @article = Article.new
#    @article.title = params[:article][:title]
#    @article.body = params[:article][:body]

#    Option 2
#    @article = Article.new title: params[:article][:title],
#                           body: params[:article][:body]

#   Option 3
    @article = Article.new params[:article]

    @article.save

    flash[:message] = "Article '#{@article.title}' Created!"

    redirect_to article_path @article
  end

  def update
    @article = Article.find params[:id]
    @article.update_attributes params[:article]

    flash[:message] = "Article '#{@article.title}' Updated!"

    redirect_to article_path @article
  end

  def destroy
    Article.find(params[:id]).destroy

    flash[:message] = "Article Deleted!"

    redirect_to articles_path
  end

  def edit
    @article = Article.find params[:id]
  end
end
