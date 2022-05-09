class Warehouse < ApplicationRecord
  validates :name, :code, :description, :city, :address, :cep, :area, presence: true
  validates :code, length: { maximum: 3 }
  validates :code, uniqueness: true
  validates :name, uniqueness: true
  validates :cep, format: { with: /\A\d{5}-?\d{3}\z/  }
end
