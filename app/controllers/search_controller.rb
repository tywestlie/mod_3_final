class SearchController < ApplicationController
  def show
    require 'pry'; binding.pry
    @word = WordSearchService.new(params[:search]).data
  end
end
