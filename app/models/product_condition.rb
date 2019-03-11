class ProductCondition < ActiveHash::Base
	self.data = [
		{value:'', name: '---'},
        {value:1, name: '新品、未使用'},
        {value:2, name: '未使用に近い'},
        {value:3, name: '目立った傷や汚れなし'},
        {value:4, name: 'やや傷や汚れあり'},
        {value:5, name: '傷や汚れあり'},
        {value:6, name: '全体的に状態が悪い'}
	]
end
