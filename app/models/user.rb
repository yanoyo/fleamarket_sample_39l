class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :products
  has_many :buyer_deals, class_name: 'Deal', :foreign_key => 'buyer_id'
  has_many :seller_deals, class_name: 'Deal', :foreign_key => 'seller_id'

  validates :nickname, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 , maximum: 128 }

  has_many :sns_credentials
  has_one :profile, dependent: :destroy, inverse_of: :user
  has_one :address, dependent: :destroy, inverse_of: :user

  accepts_nested_attributes_for :profile, allow_destroy: true, reject_if: :all_blank, update_only: true
  accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank, update_only: true


  def self.create_from_auth!(auth)
    data = auth['info']
    nickname = auth['info']['name'].split(" ")[0]
    user = User.where(email: data['email']).first_or_create(
      nickname: nickname,
      email: data['email'],
      password: Devise.friendly_token[0,20]
    )
    return user
  end
end
