class ProductModel < ApplicationRecord
  belongs_to :supplier
  before_validation :upcase_sku

  validates :name, :weight, :width, :height, :depth, :sku, :supplier_id, presence: true
  validates :sku, length: { is: 20}
  validates :sku, uniqueness: true
  validates :weight, :width, :height, :depth, numericality: { greater_than: 1,  only_integer: true }
  private

  def upcase_sku
    self.sku = self.sku.upcase
  end
end
