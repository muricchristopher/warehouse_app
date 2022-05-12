class Supplier < ApplicationRecord
  validates :corporate_name, :brand_name, :registration_number, :email, presence:true
  validates :registration_number, uniqueness:true
  validates :registration_number, format: { with: /\A[0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2}\z/
  }
  validates :email, format: {with:
  /\S+@\S+\.\S+/}
end


