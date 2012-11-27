class SearchController < ApplicationController

  def show
    redirect_to type_of_thing_path(params[:q])
  end

end
