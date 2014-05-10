# Encoding: utf-8
module ActsAsStarrable
  module StarrableHelper
    def stars(starrable)
      render :partial => 'starrable/stars', :locals => {
        :starrable => starrable
      }
    end
  end
end
