class TypeOfThingController < ApplicationController

  def show

    type_of_thing_name = params[:id].downcase.singularize

    begin
      @type_of_thing = TypeOfThing.find_by_name!(type_of_thing_name)

      things = @type_of_thing.things.with_image.order('classicness_score DESC')

      @classic_things = things[0..2]

      @other_things = things[3..9999]

    rescue ActiveRecord::RecordNotFound

      @type_of_thing = TypeOfThing.new({:name => type_of_thing_name})
      render 'not_found'
    end

  end

end
