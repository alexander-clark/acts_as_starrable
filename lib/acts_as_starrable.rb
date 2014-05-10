# Encoding: utf-8
require 'acts_as_starrable/engine'
require 'acts_as_starrable/starrable'
require 'acts_as_starrable/starrable_helper'
require 'acts_as_starrable/rating'

module ActsAsStarrable
end

ActionView::Base.send :include, ActsAsStarrable::StarrableHelper
