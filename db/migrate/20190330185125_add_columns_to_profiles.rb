class AddColumnsToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :family_name,      :string,  null: false
    add_column :profiles, :first_name,       :string,  null: false
    add_column :profiles, :family_name_kana, :string,  null: false
    add_column :profiles, :first_name_kana,  :string,  null: false
    add_column :profiles, :birth_year,       :integer, null: false
    add_column :profiles, :birth_month,      :integer, null: false
    add_column :profiles, :birth_day,        :integer, null: false
    add_column :profiles, :mobile_phone,     :string,  null: false
    add_column :profiles, :card_number,      :string,  null: true
    add_column :profiles, :expiration_month, :string,  null: true
    add_column :profiles, :expiration_year,  :string,  null: true
    add_column :profiles, :security_code,    :string,  null: true
    add_reference :profiles, :user,          foreign_key: :true
  end
end
