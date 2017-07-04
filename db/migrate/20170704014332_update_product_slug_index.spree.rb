# This migration comes from spree (originally 20141217215630)
class UpdateProductSlugIndex < ActiveRecord::Migration[4.2]
  include Spree::MigrationHelpers

  def change
    safe_remove_index :spree_products, :slug
    safe_add_index :spree_products, :slug, unique: true
  end
end
