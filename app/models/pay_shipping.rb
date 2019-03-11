class PayShipping < ActiveHash::Base
	self.data = [
	  {value: '', name: '---'},
      {value: '1', name: '送料込み(出品者負担)'},
      {value: '2', name: '着払い(購入者負担)'}
	]
end
