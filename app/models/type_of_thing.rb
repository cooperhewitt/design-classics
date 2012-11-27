class TypeOfThing < ActiveRecord::Base
  attr_accessible :ch_id, :name, :things_count

  has_many :thingings
  has_many :things, :through => :thingings


  def self.update_things_with_images_count!

    self.find_each do |type_of_thing|

      type_of_thing.things_with_images_count = type_of_thing.things.with_image.count
      type_of_thing.save

    end

  end

end
