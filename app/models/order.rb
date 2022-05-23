class Order < ApplicationRecord
  belongs_to :warehouse
  belongs_to :user
  belongs_to :supplier

  # before_create :unique_code
  before_validation :unique_code

  validates :code, presence: true, uniqueness: true, length: {is: 11}
  validates :estimated_delivery_date, presence: true
  validate :estimated_delivery_date_is_future

  private

  def unique_code
    self.code = "##{SecureRandom.hex(5).upcase}"
  end

  def estimated_delivery_date_is_future
    if self.estimated_delivery_date.present? && self.estimated_delivery_date <= Date.today
      self.errors.add(:estimated_delivery_date, "deve ser futura")
    end
  end


end
