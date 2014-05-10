# Encoding: utf-8
module ActsAsStarrable
  class Rating < ::ActiveRecord::Base
    attr_accessible :starrable_id, :starrable_type, :rater_id, :rater_type,
                    :rating

    belongs_to :starrable, :polymorphic => true
    belongs_to :rater, :polymorphic => true
  end
end
