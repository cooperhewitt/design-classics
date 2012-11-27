class VotesController < ApplicationController

  def create

    @thing = Thing.find(params[:thing_id])
    @type_of_thing = @thing.types_of_thing.first

    if params[:vote] == 'up'
      @thing.classicness_score += 1
    elsif params[:vote] == 'down'
      @thing.classicness_score -= 1
    end

    @thing.save
    render 'show'
#    redirect_to type_of_thing_path(thing_type.name.downcase.pluralize)

  end

end
