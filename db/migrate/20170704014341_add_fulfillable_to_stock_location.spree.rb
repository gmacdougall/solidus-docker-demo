# This migration comes from spree (originally 20150203151219)
class AddFulfillableToStockLocation < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_stock_locations, :fulfillable, :boolean, default: true, null: false
  end
end
