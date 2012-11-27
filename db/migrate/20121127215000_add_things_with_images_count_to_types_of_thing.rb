class AddThingsWithImagesCountToTypesOfThing < ActiveRecord::Migration
  def change
    add_column :types_of_thing, :things_with_images_count, :integer, :default => 0, :null => false
  end
end
