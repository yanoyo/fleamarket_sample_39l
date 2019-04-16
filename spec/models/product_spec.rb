require 'rails_helper'
describe Product do
  describe '#create' do
    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力して下さい")
    end
    it "is valid with a name the has less than 40 characters" do
      product = build(:product, name: Faker::String.random(41))
      product.valid?
      expect(product.errors[:name]).to include("40文字以下で入力してください。")
    end
    it "is invalid without a description" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("を入力して下さい")
    end
    it "is valid with a description the has less than 1000 characters" do
      product = build(:product, description: Faker::String.random(1001))
      product.valid?
      expect(product.errors[:description]).to include("1000文字以下で入力してください。")
    end
    it "is invalid without a category_id" do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("を入力して下さい")
    end
    it "is invalid without a price" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力して下さい")
    end
    it "is invalid without a price the greater_than_or_equal_to 300" do
      product = build(:product, price: "200")
      product.valid?
      expect(product.errors[:price]).to include("300以上を入力してください。")
    end
    it "is invalid without a price the less_than_or_equal_to 9999999" do
      product = build(:product, price: "99999999")
      product.valid?
      expect(product.errors[:price]).to include("9999999以下を入力して下さい")
    end
    it "is invalid without a condition" do
      product = build(:product, condition: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力して下さい")
    end
    it "is invalid without a shipping_fee" do
      product = build(:product, shipping_fee: nil)
      product.valid?
      expect(product.errors[:shipping_fee]).to include("を入力して下さい")
    end
    it "is invalid without a shipping_method" do
      product = build(:product, shipping_method: nil)
      product.valid?
      expect(product.errors[:shipping_method]).to include("を入力して下さい")
    end
    it "is invalid without a shipping_from" do
      product = build(:product, shipping_from: nil)
      product.valid?
      expect(product.errors[:shipping_from]).to include("を入力して下さい")
    end
    it "is invalid without a shipping_term" do
      product = build(:product, shipping_term: nil)
      product.valid?
      expect(product.errors[:shipping_term]).to include("を入力して下さい")
    end
  end
end