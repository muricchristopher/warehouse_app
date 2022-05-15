require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    it 'false when name is empty' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      product = ProductModel.create(name:"", weight:8000, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      expect(product).to_not(be_valid)
    end

    it 'false when weight is empty' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      product = ProductModel.create(name:"TV 32", weight:"", width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      expect(product).to_not(be_valid)
    end

    it 'false when weight is 0' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      product = ProductModel.create(name:"TV 32", weight:0, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      expect(product).to_not(be_valid)
    end

     it 'false when weight is less than 1' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      product = ProductModel.create(name:"TV 32", weight:-2, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      expect(product).to_not(be_valid)
    end

    it 'false when SKU is empty' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      product = ProductModel.create(name:"TV 32", weight:8000, width:70, height:45, depth:10, sku:"", supplier: supplier)

      expect(product).to_not(be_valid)
    end

    it 'false when SKU length is not equals to 20' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      product = ProductModel.create(name:"TV 32", weight:8000, width:70, height:45, depth:10, sku:"SAMMASDNASDJADJASJ", supplier: supplier)

      expect(product).to_not(be_valid)
    end

    it 'false when SKU attribute is not unique' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      first_product = ProductModel.create(name:"TV SAMSUNG 42", weight:8000, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      second_product = ProductModel.create(name:"TV 32", weight:8000, width:70, height:45, depth:10, sku:"TV32SAMSUNG12M3MDJFH", supplier: supplier)

      expect(second_product).to_not(be_valid)
    end

    it 'false when productModel does not have a supplier' do
       product = ProductModel.create(name:"TV 32", weight: 200, width: 100, height:100, depth:100, sku:"Tv32SAMSUNG12M3MDJFH", supplier: nil)


      expect(product).to_not(be_valid)
    end

    it 'true when all required attributes are fullfilled' do
      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      product = ProductModel.create(name:"TV 32", weight: 200, width: 100, height:100, depth:100, sku:"Tv32SAMSUNG12M3MDJFH", supplier: supplier)

      expect(product).to(be_valid)
    end

  end
end
