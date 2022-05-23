class Order < ApplicationRecord
  belongs_to :warehouse
  belongs_to :user
  belongs_to :supplier

  # before_create :unique_code
  before_validation :unique_code

  validates :code, presence: true, uniqueness: true, length: {is: 11}



  private

  def unique_code
    self.code = "##{SecureRandom.hex(5).upcase}"
  end

end
