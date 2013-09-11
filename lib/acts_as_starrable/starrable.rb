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
        include ActsAsStarrable::Starrable::LocalInstanceMethods
      end
    end
    
    module LocalInstanceMethods
      def starrable?
        true
      end
    end
  end
end

ActiveRecord::Base.send :include, ActsAsStarrable::Starrable