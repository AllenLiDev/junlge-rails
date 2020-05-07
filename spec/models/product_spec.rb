require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      @category = Category.create(name: "games")
      @product = @category.products.create(name:"Zelda", quantity: 7, price: 1337)
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.create(name: "games")
      @product = @category.products.create(quantity: 7, price: 1337)
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.create(name: "games")
      @product = @category.products.create(name:"Zelda", quantity: 77)
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.create(name: "games")
      @product = @category.products.create(name:"Zelda", price: 1337)
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product = Product.create(name:"Zelda", quantity: 7, price: 1337)
      expect(@product).to_not be_valid
    end
  end
end
