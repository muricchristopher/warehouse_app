class AddColumnsToWarehouses < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouses, :code, :string
    add_column :warehouses, :city, :string
    add_column :warehouses, :area, :integer
  end
end
