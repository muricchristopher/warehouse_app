class RemoveAdressFromWarehouses < ActiveRecord::Migration[7.0]
  def change
    remove_column :warehouses, :adress, :string
  end
end
