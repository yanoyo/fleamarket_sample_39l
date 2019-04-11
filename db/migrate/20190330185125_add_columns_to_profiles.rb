class AddColumnsToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :family_name,      :string,  null: false
    add_column :profiles, :first_name,       :string,  null: false
    add_column :profiles, :family_name_kana, :string,  null: false
    add_column :profiles, :first_name_kana,  :string,  null: false
    add_column :profiles, :birth_year,       :integer, null: false
    add_column :profiles, :birth_month,      :integer, null: false
    add_column :profiles, :birth_day,        :integer, null: false
    add_reference :profiles, :user, foreign_key: :true
  end
end
