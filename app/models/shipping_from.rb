class ShippingFrom < ApplicationRecord
  enum shipping_from: { 
    unselected: 0,
    hokkaido: 1,
    aomori: 2
  }

  def self.localed_shipping_froms
    shipping_froms.keys.map do |s|
      [ApplicationController.helpers.t("shipping_from.shipping_from.#{s}"), s]
    end
  end
end
