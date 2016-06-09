class WordsController < ApplicationController
  def index
    @words = Word.paginate page: params[:page]
    @categories = Category.all
  end
end
