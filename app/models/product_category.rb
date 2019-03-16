class ProductCategory < ActiveHash::Base
	self.data = [
	  {value: '', name: '---'},
      {value:1, name: 'レディース'},
      {value:2, name: 'メンズ'},
      {value:3, name: 'ベビー・キッズ'},
      {value:4, name: 'インテリア・住まい・小物'},
      {value:5, name: '本・音楽・ゲーム'},
      {value:6, name: 'おもちゃ・ホビー・グッズ'},
      {value:7, name: 'コスメ・香水・美容'},
      {value:8, name: '家電・スマホ・カメラ'},
      {value:9, name: 'スポーツ・レジャー'},
      {value:10, name: 'ハンドメイド'},
      {value:11, name: 'チケット'},
      {value:12, name: '自動車・オートバイ'},
      {value:13, name: 'その他'}
	]
end
