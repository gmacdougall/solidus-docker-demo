# This migration comes from spree (originally 20160718205859)
class AddReimbursementIdIndexToSpreeRefunds < ActiveRecord::Migration[4.2]
  def change
    add_index(:spree_refunds, :reimbursement_id)
  end
end
