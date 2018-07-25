class SearchController < ApplicationController
  def show
    @search_word = params[:search]
    @sentences = WordSearchService.new(params[:search]).search
  end
end
