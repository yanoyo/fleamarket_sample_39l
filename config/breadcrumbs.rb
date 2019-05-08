crumb :root do
  link "メルカリ", root_path
end

crumb :product do |product|
  link "#{product.name}", product_path(params[:id])
end

crumb :users do
  link 'マイページ', user_path(params[:id])
end

crumb :edit_user do |user|
  link "プロフィール", edit_user_path(user)
  parent :users
end

crumb :logout_user do |user|
  link "ログアウト", logout_users_path(user)
  parent :users
end

crumb :edit_user_profile do |user|
  link "本人情報の登録", edit_user_profiles_path(user)
  parent :users
end

crumb :card do
  link "支払い方法", card_users_path
  parent :users
end
