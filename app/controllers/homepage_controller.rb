class HomepageController < ApplicationController

  def show
    @example_types = TypeOfThing.where(:things_with_images_count => 6..999999).order('random()').limit(10)
  end

end
