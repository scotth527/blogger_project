class ArticlesController < ApplicationController
    def index
        ## Instance variable allows both controller and view to access it
        @articles = Article.all
    end
end
