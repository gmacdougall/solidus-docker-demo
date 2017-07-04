# This migration comes from spree (originally 20141231151320)
class AddDefaultColumnToPrice < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_prices, :is_default, :boolean, default: true, null: false
  end
end
