class Public::TagsearchesController < ApplicationController
  
  def search
    @model = Post
    @word = params[:content]
    @posts = Post.where("tag LIKE?","%#{@word}%").page(params[:page])
    render "tagsearches/tagsearch"
  end
end
