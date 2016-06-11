class WordsController < ApplicationController
  def index
    @categories = Category.all
    filter_type = params[:filter_type]
    filter_type = "alls" if filter_type.nil?
    @words = Word.by_category(params[:category_id])
     .send(filter_type, current_user.id)
  end
end
