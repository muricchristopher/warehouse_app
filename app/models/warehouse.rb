class Warehouse < ApplicationRecord
  validates :name, :code, :description, :city, :address, :zip_code, :area, presence: true
  validates :code, length: { maximum: 3 }
  validates :code, uniqueness: true
  validates :name, uniqueness: true
  validates :zip_code, format: { with: /\A\d{5}-?\d{3}\z/  }

  before_validation :upcase_code

  private
    def upcase_code
      self.code = self.code.upcase
    end
end
