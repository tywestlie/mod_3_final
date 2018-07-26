class SearchController < ApplicationController
  def show
    @presenter = SearchPresenter.new(params[:search])
  end
end
