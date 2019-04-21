class ShippingMethod < ApplicationRecord
  enum shipping_method: { 
    unselected: 0,
    undecided: 1,
    rakuraku_mercari: 2
  }

  def self.localed_shipping_methods
    shipping_methods.keys.map do |s|
      [ApplicationController.helpers.t("shipping_method.shipping_method.#{s}"), s]
    end
  end
end
