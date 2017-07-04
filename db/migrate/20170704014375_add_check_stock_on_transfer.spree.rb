# This migration comes from spree (originally 20150515170322)
class AddCheckStockOnTransfer < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_stock_locations, :check_stock_on_transfer, :boolean, default: true
  end
end
