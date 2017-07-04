# This migration comes from spree (originally 20150313192827)
class AddIndexToInventoryUnitsCartonId < ActiveRecord::Migration[4.2]
  def change
    add_index :spree_inventory_units, :carton_id
  end
end
