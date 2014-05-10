class Flick < ActiveRecord::Base
  attr_accessible :name
  acts_as_starrable
end