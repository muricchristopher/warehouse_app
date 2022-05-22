class Order < ApplicationRecord
    self.table_name = 'orders'

  belongs_to :warehouse
  belongs_to :user
  belongs_to :supplier
end
