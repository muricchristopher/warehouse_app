require 'rails_helper'

RSpec.describe Supplier, type: :model do

  describe '#valid?' do

    it 'false when Razão Social is empty' do
      supplier = Supplier.create(corporate_name: "", brand_name: "ABA", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
      state:"São Paulo", email:"contato@abaproducuesltda.com.br")

      expect(supplier).to_not be_valid
    end

     it 'false when Nome Fantasia is empty' do
      supplier = Supplier.create(corporate_name: "ABA Produções LTDA", brand_name: "", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
      state:"São Paulo", email:"contato@abaproducuesltda.com.br")

      expect(supplier).to_not be_valid
    end

    it 'false when CNPJ is empty' do
      supplier = Supplier.create(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
      state:"São Paulo", email:"contato@abaproducuesltda.com.br")

      expect(supplier).to_not be_valid
    end

    it 'false when CNPJ is in invalid format' do
      supplier = Supplier.create(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"21812831013871823777",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
      state:"São Paulo", email:"contato@abaproducuesltda.com.br")

      expect(supplier).to_not be_valid
    end

    it 'false when CNPJ is not unique' do

      first_supplier = Supplier.create(corporate_name: "Nova ABA", brand_name: "ABA2", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
      state:"São Paulo", email:"contato2@abaproducuesltda2.com.br")

      second_supplier = Supplier.create(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
      state:"São Paulo", email:"contato@abaproducuesltda.com.br")

      expect(second_supplier).to_not be_valid
    end

     it 'false when E-mail is empty' do
      supplier = Supplier.create(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
      state:"São Paulo", email:"")

      expect(supplier).to_not be_valid
    end

    it 'false when E-mail is invalid format' do
      supplier = Supplier.create(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"59291534000167",full_address:"Rua Marechal dos Andares, 1212", city:"São Paulo",
      state:"São Paulo", email:"joao@bom")

      expect(supplier).to_not be_valid
    end

    it 'true when only required attributes are fullfilled' do
      supplier = Supplier.create(corporate_name: "ABA Produções LTDA", brand_name: "ABA", registration_number:"59291534000167",full_address:"", city:"",
      state:"", email:"contato2@abaproducuesltda2.com.br")

      expect(supplier).to be_valid
    end

  end

end
