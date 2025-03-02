class TagsearchesController < ApplicationController
  
  def search
    @word = params[:content]
    @posts = Post.where("tag LIKE?","%#{@word}%")
    render "tagsearches/tagsearch"
  end
end
