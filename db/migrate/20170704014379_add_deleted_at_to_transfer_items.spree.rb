# This migration comes from spree (originally 20150601204148)
class AddDeletedAtToTransferItems < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_transfer_items, :deleted_at, :datetime
  end
end
