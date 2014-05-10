# Encoding: utf-8
module ActsAsStarrable
  module Starrable
    def starrable?
      false
    end

    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_starrable
        has_many :ratings, :as => :starrable, :dependent => :destroy,
                           :class_name => 'ActsAsStarrable::Rating'
        include ActsAsStarrable::Starrable::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def starrable?
        true
      end

      def average_rating
        if avg = ratings.average('rating')
          (avg * 2).round / 2.0 # round to nearest .5 or .0
        end
      end

      def max_rating
        5
      end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsStarrable::Starrable
