class TagsController < ApplicationController

    def index
        @tags = Tag.all
        puts @tags
    end

    def show
        @tag = Tag.find(params[:id])
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        flash.notice = "Tag '#{@tag.name}' Deleted!"
        redirect_to tags_path
    end

    def edit
        @tag = Tag.find(params[:id])
    end

    def update
        @tag = Tag.find(params[:id])
        @tag.update(tag_params)

        flash.notice = "Tag '#{@tag.name}' Updated!"

        redirect_to tag_path(@tag)
    end

    def tag_params
        params.require(:tag).permit(:name)
    end


end
