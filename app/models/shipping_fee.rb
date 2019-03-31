class ShippingFee < ApplicationRecord
	enum shipping_fee: { 
	  unselected: 0,
	  postage_included: 1,
	  cash_on_delivery: 2
	}

	def self.localed_shipping_fees
	  shipping_fees.keys.map do |s|
	    [ApplicationController.helpers.t("shipping_fee.shipping_fee.#{s}"), s]
	  end
	end
end
