class Thing < ActiveRecord::Base
  attr_accessible

  has_many :thingings
  has_many :types_of_thing, :through => :thingings

  scope :with_image, where('image IS NOT NULL')

  def ch_link
    "https://collection.cooperhewitt.org/objects/" + ch_id.to_s + "/"
  end

end
