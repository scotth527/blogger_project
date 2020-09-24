class ArticlesController < ApplicationController
    include ArticlesHelper

    before_action :require_login, only: [:new, :create, :destroy, :edit, :update]

    def index
        ## Instance variable allows both controller and view to access it
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])

        @comment = Comment.new
        @comment.article_id = @article.id
    end

    def new
        @article = Article.new

    end

    def create

        @article = Article.new(article_params)
        @article.save

        flash.notice = "Article Posted!"

        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy


        flash.notice = "Article '#{@article.title}' Deleted!"

        redirect_to articles_path
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' Updated!"

        redirect_to article_path(@article)
    end
end
