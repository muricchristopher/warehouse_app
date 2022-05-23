require 'rails_helper'

RSpec.describe Order, type: :model do

  describe '#valid?' do
    it 'true when all required attributes are fullfilled' do
      user = User.create!(name:"João", email:"joao@gmail.com", password:"123456")

      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      warehouse = Warehouse.create!(name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")

      order = Order.create!(warehouse: warehouse, user:user, supplier:supplier, estimated_delivery_date: "2022-10-21")

      expect(order).to be_valid
    end

    it 'false when estimated_delivery_date is empty' do
      order = Order.new(estimated_delivery_date: '')

      order.valid?

      res = order.errors.include? :estimated_delivery_date

      expect(res).to be(true)
      expect(order.errors[:estimated_delivery_date]).to include("não pode ficar em branco")
    end

    it 'false when estimated_delivery_date is in the past' do
      order = Order.new(estimated_delivery_date: 10.day.ago)

      order.valid?

      res = order.errors.include? :estimated_delivery_date

      expect(res).to be(true)
      expect(order.errors[:estimated_delivery_date]).to include("deve ser futura")
    end

    it 'false when estimated_delivery_date' do
      order = Order.new(estimated_delivery_date: Date.today)

      order.valid?

      res = order.errors.include? :estimated_delivery_date

      expect(res).to be(true)
      expect(order.errors[:estimated_delivery_date]).to include("deve ser futura")
    end

    it 'true when estimated_delivery_date is in future' do
      order = Order.new(estimated_delivery_date: Date.tomorrow)

      order.valid?

      res = order.errors.include? :estimated_delivery_date

      expect(res).to be(false)
      expect(order.errors[:estimated_delivery_date]).not_to include("deve ser futura")
    end

  end
  describe 'Generate a random and unique code' do
    it 'when create a new order' do
      user = User.create!(name:"João", email:"joao@gmail.com", password:"123456")

      supplier = Supplier.create!(brand_name:"Samsung", corporate_name:"Samsung Eletrônicos LTDA", registration_number: "89012347000180", email:"sac@samsung.com.br")

      warehouse = Warehouse.create!(name: "Galpão do Rio", code: "SDU", city:"Rio de Janeiro", area: 60_000, zip_code:"08140490", description:"Um belo galpão", address:"Rua")

      first_order = Order.create!(warehouse: warehouse, user:user, supplier:supplier, estimated_delivery_date: "2022-10-21")
      second_order = Order.create!(warehouse: warehouse, user:user, supplier:supplier, estimated_delivery_date: "2022-10-21")

      first_code = first_order.code
      second_code = second_order.code

      expect(first_code).not_to(be_empty)
      expect(first_code).not_to(be_nil)
      expect(first_code).not_to eq(second_code)
      expect(first_code.length && second_code.length).to eq(11)
    end
  end
end
