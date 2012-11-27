class Thinging < ActiveRecord::Base
  attr_accessible

  belongs_to :thing, :counter_cache => :types_count
  belongs_to :type_of_thing, :counter_cache => :things_count

end
