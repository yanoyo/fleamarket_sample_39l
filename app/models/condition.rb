class Condition < ApplicationRecord
  has_one :product

  enum condition: { 
  	unselected: 0,
  	unused: 1,
  	near_unused: 2,
  	no_noticeable_scratches_or_strains: 3,
  	some_scratches_and_dirt: 4,
  	scratches_and_dirt: 5,
  	bad: 6
  }

  def self.localed_conditions
    conditions.values.map do |s|
      [ApplicationController.helpers.t("condition.condition.#{s}"), s]
    end
  end

end
