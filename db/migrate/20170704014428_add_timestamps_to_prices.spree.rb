# This migration comes from spree (originally 20160318145302)
class AddTimestampsToPrices < ActiveRecord::Migration[4.2]
  def change
    change_table(:spree_prices) { |t| t.timestamps null: true }
  end
end
