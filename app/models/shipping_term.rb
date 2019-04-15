class ShippingTerm < ApplicationRecord
  enum shipping_term: { 
  	unselected: 0,
  	one_to_two_days: 1,
  	two_to_three_days: 2,
  	four_to_seven_days: 3
  }

  def self.localed_shipping_terms
  	shipping_terms.keys.map do |s|
  	  [ApplicationController.helpers.t("shipping_term.shipping_term.#{s}"), s]
	  end
  end
end
