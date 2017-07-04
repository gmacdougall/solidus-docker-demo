# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170704014456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "spree_addresses", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.string   "company"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["country_id"], name: "index_spree_addresses_on_country_id", using: :btree
    t.index ["firstname"], name: "index_addresses_on_firstname", using: :btree
    t.index ["lastname"], name: "index_addresses_on_lastname", using: :btree
    t.index ["state_id"], name: "index_spree_addresses_on_state_id", using: :btree
  end

  create_table "spree_adjustment_reasons", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["active"], name: "index_spree_adjustment_reasons_on_active", using: :btree
    t.index ["code"], name: "index_spree_adjustment_reasons_on_code", using: :btree
  end

  create_table "spree_adjustments", force: :cascade do |t|
    t.string   "source_type"
    t.integer  "source_id"
    t.string   "adjustable_type"
    t.integer  "adjustable_id",                                                 null: false
    t.decimal  "amount",               precision: 10, scale: 2
    t.string   "label"
    t.boolean  "eligible",                                      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id",                                                      null: false
    t.boolean  "included",                                      default: false
    t.integer  "promotion_code_id"
    t.integer  "adjustment_reason_id"
    t.boolean  "finalized",                                     default: false, null: false
    t.index ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type", using: :btree
    t.index ["adjustable_id"], name: "index_adjustments_on_order_id", using: :btree
    t.index ["eligible"], name: "index_spree_adjustments_on_eligible", using: :btree
    t.index ["order_id"], name: "index_spree_adjustments_on_order_id", using: :btree
    t.index ["promotion_code_id"], name: "index_spree_adjustments_on_promotion_code_id", using: :btree
    t.index ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type", using: :btree
  end

  create_table "spree_assets", force: :cascade do |t|
    t.string   "viewable_type"
    t.integer  "viewable_id"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    limit: 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["viewable_id"], name: "index_assets_on_viewable_id", using: :btree
    t.index ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type", using: :btree
  end

  create_table "spree_calculators", force: :cascade do |t|
    t.string   "type"
    t.string   "calculable_type"
    t.integer  "calculable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preferences"
    t.index ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type", using: :btree
    t.index ["id", "type"], name: "index_spree_calculators_on_id_and_type", using: :btree
  end

  create_table "spree_cartons", force: :cascade do |t|
    t.string   "number"
    t.string   "external_number"
    t.integer  "stock_location_id"
    t.integer  "address_id"
    t.integer  "shipping_method_id"
    t.string   "tracking"
    t.datetime "shipped_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imported_from_shipment_id"
    t.index ["external_number"], name: "index_spree_cartons_on_external_number", using: :btree
    t.index ["imported_from_shipment_id"], name: "index_spree_cartons_on_imported_from_shipment_id", unique: true, using: :btree
    t.index ["number"], name: "index_spree_cartons_on_number", unique: true, using: :btree
    t.index ["stock_location_id"], name: "index_spree_cartons_on_stock_location_id", using: :btree
  end

  create_table "spree_countries", force: :cascade do |t|
    t.string   "iso_name"
    t.string   "iso"
    t.string   "iso3"
    t.string   "name"
    t.integer  "numcode"
    t.boolean  "states_required", default: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["iso"], name: "index_spree_countries_on_iso", using: :btree
  end

  create_table "spree_credit_cards", force: :cascade do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.boolean  "default",                     default: false, null: false
    t.integer  "address_id"
    t.index ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id", using: :btree
    t.index ["user_id"], name: "index_spree_credit_cards_on_user_id", using: :btree
  end

  create_table "spree_customer_returns", force: :cascade do |t|
    t.string   "number"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_inventory_units", force: :cascade do |t|
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pending",      default: true
    t.integer  "line_item_id"
    t.integer  "carton_id"
    t.index ["carton_id"], name: "index_spree_inventory_units_on_carton_id", using: :btree
    t.index ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id", using: :btree
    t.index ["order_id"], name: "index_inventory_units_on_order_id", using: :btree
    t.index ["shipment_id"], name: "index_inventory_units_on_shipment_id", using: :btree
    t.index ["variant_id"], name: "index_inventory_units_on_variant_id", using: :btree
  end

  create_table "spree_line_item_actions", force: :cascade do |t|
    t.integer  "line_item_id",             null: false
    t.integer  "action_id",                null: false
    t.integer  "quantity",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["action_id"], name: "index_spree_line_item_actions_on_action_id", using: :btree
    t.index ["line_item_id"], name: "index_spree_line_item_actions_on_line_item_id", using: :btree
  end

  create_table "spree_line_items", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "quantity",                                                      null: false
    t.decimal  "price",                precision: 10, scale: 2,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cost_price",           precision: 10, scale: 2
    t.integer  "tax_category_id"
    t.decimal  "adjustment_total",     precision: 10, scale: 2, default: "0.0"
    t.decimal  "additional_tax_total", precision: 10, scale: 2, default: "0.0"
    t.decimal  "promo_total",          precision: 10, scale: 2, default: "0.0"
    t.decimal  "included_tax_total",   precision: 10, scale: 2, default: "0.0", null: false
    t.index ["order_id"], name: "index_spree_line_items_on_order_id", using: :btree
    t.index ["variant_id"], name: "index_spree_line_items_on_variant_id", using: :btree
  end

  create_table "spree_log_entries", force: :cascade do |t|
    t.string   "source_type"
    t.integer  "source_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["source_id", "source_type"], name: "index_spree_log_entries_on_source_id_and_source_type", using: :btree
  end

  create_table "spree_option_type_prototypes", force: :cascade do |t|
    t.integer  "prototype_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_option_types", force: :cascade do |t|
    t.string   "name",         limit: 100
    t.string   "presentation", limit: 100
    t.integer  "position",                 default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["position"], name: "index_spree_option_types_on_position", using: :btree
  end

  create_table "spree_option_values", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["option_type_id"], name: "index_spree_option_values_on_option_type_id", using: :btree
    t.index ["position"], name: "index_spree_option_values_on_position", using: :btree
  end

  create_table "spree_option_values_variants", force: :cascade do |t|
    t.integer  "variant_id"
    t.integer  "option_value_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id", using: :btree
    t.index ["variant_id"], name: "index_spree_option_values_variants_on_variant_id", using: :btree
  end

  create_table "spree_order_mutexes", force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.datetime "created_at"
    t.index ["order_id"], name: "index_spree_order_mutexes_on_order_id", unique: true, using: :btree
  end

  create_table "spree_order_stock_locations", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "variant_id"
    t.integer  "quantity"
    t.integer  "stock_location_id"
    t.boolean  "shipment_fulfilled", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_orders", force: :cascade do |t|
    t.string   "number",                 limit: 32
    t.decimal  "item_total",                        precision: 10, scale: 2, default: "0.0",   null: false
    t.decimal  "total",                             precision: 10, scale: 2, default: "0.0",   null: false
    t.string   "state"
    t.decimal  "adjustment_total",                  precision: 10, scale: 2, default: "0.0",   null: false
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                     precision: 10, scale: 2, default: "0.0"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
    t.string   "last_ip_address"
    t.integer  "created_by_id"
    t.decimal  "shipment_total",                    precision: 10, scale: 2, default: "0.0",   null: false
    t.decimal  "additional_tax_total",              precision: 10, scale: 2, default: "0.0"
    t.decimal  "promo_total",                       precision: 10, scale: 2, default: "0.0"
    t.string   "channel",                                                    default: "spree"
    t.decimal  "included_tax_total",                precision: 10, scale: 2, default: "0.0",   null: false
    t.integer  "item_count",                                                 default: 0
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.boolean  "confirmation_delivered",                                     default: false
    t.string   "guest_token"
    t.datetime "canceled_at"
    t.integer  "canceler_id"
    t.integer  "store_id"
    t.string   "approver_name"
    t.boolean  "frontend_viewable",                                          default: true,    null: false
    t.index ["approver_id"], name: "index_spree_orders_on_approver_id", using: :btree
    t.index ["bill_address_id"], name: "index_spree_orders_on_bill_address_id", using: :btree
    t.index ["completed_at"], name: "index_spree_orders_on_completed_at", using: :btree
    t.index ["created_by_id"], name: "index_spree_orders_on_created_by_id", using: :btree
    t.index ["guest_token"], name: "index_spree_orders_on_guest_token", using: :btree
    t.index ["number"], name: "index_spree_orders_on_number", using: :btree
    t.index ["ship_address_id"], name: "index_spree_orders_on_ship_address_id", using: :btree
    t.index ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id", using: :btree
    t.index ["user_id"], name: "index_spree_orders_on_user_id", using: :btree
  end

  create_table "spree_orders_promotions", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "promotion_id"
    t.integer  "promotion_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["order_id", "promotion_id"], name: "index_spree_orders_promotions_on_order_id_and_promotion_id", using: :btree
    t.index ["promotion_code_id"], name: "index_spree_orders_promotions_on_promotion_code_id", using: :btree
  end

  create_table "spree_payment_capture_events", force: :cascade do |t|
    t.decimal  "amount",     precision: 10, scale: 2, default: "0.0"
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id", using: :btree
  end

  create_table "spree_payment_methods", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",             default: true
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "auto_capture"
    t.text     "preferences"
    t.string   "preference_source"
    t.integer  "position",           default: 0
    t.boolean  "available_to_users", default: true
    t.boolean  "available_to_admin", default: true
    t.index ["id", "type"], name: "index_spree_payment_methods_on_id_and_type", using: :btree
  end

  create_table "spree_payments", force: :cascade do |t|
    t.decimal  "amount",               precision: 10, scale: 2, default: "0.0", null: false
    t.integer  "order_id"
    t.string   "source_type"
    t.integer  "source_id"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
    t.index ["number"], name: "index_spree_payments_on_number", unique: true, using: :btree
    t.index ["order_id"], name: "index_spree_payments_on_order_id", using: :btree
    t.index ["payment_method_id"], name: "index_spree_payments_on_payment_method_id", using: :btree
    t.index ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type", using: :btree
  end

  create_table "spree_preferences", force: :cascade do |t|
    t.text     "value"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_spree_preferences_on_key", unique: true, using: :btree
  end

  create_table "spree_prices", force: :cascade do |t|
    t.integer  "variant_id",                                     null: false
    t.decimal  "amount",                precision: 10, scale: 2
    t.string   "currency"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_iso", limit: 2
    t.index ["country_iso"], name: "index_spree_prices_on_country_iso", using: :btree
    t.index ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency", using: :btree
  end

  create_table "spree_product_option_types", force: :cascade do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["option_type_id"], name: "index_spree_product_option_types_on_option_type_id", using: :btree
    t.index ["position"], name: "index_spree_product_option_types_on_position", using: :btree
    t.index ["product_id"], name: "index_spree_product_option_types_on_product_id", using: :btree
  end

  create_table "spree_product_promotion_rules", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "promotion_rule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "index_products_promotion_rules_on_product_id", using: :btree
    t.index ["promotion_rule_id"], name: "index_products_promotion_rules_on_promotion_rule_id", using: :btree
  end

  create_table "spree_product_properties", force: :cascade do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",    default: 0
    t.index ["position"], name: "index_spree_product_properties_on_position", using: :btree
    t.index ["product_id"], name: "index_product_properties_on_product_id", using: :btree
    t.index ["property_id"], name: "index_spree_product_properties_on_property_id", using: :btree
  end

  create_table "spree_products", force: :cascade do |t|
    t.string   "name",                 default: "",   null: false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "slug"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "promotionable",        default: true
    t.string   "meta_title"
    t.index ["available_on"], name: "index_spree_products_on_available_on", using: :btree
    t.index ["deleted_at"], name: "index_spree_products_on_deleted_at", using: :btree
    t.index ["name"], name: "index_spree_products_on_name", using: :btree
    t.index ["slug"], name: "index_spree_products_on_slug", unique: true, using: :btree
  end

  create_table "spree_products_taxons", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "taxon_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["position"], name: "index_spree_products_taxons_on_position", using: :btree
    t.index ["product_id"], name: "index_spree_products_taxons_on_product_id", using: :btree
    t.index ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id", using: :btree
  end

  create_table "spree_promotion_action_line_items", force: :cascade do |t|
    t.integer  "promotion_action_id"
    t.integer  "variant_id"
    t.integer  "quantity",            default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["promotion_action_id"], name: "index_spree_promotion_action_line_items_on_promotion_action_id", using: :btree
    t.index ["variant_id"], name: "index_spree_promotion_action_line_items_on_variant_id", using: :btree
  end

  create_table "spree_promotion_actions", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "position"
    t.string   "type"
    t.datetime "deleted_at"
    t.text     "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["deleted_at"], name: "index_spree_promotion_actions_on_deleted_at", using: :btree
    t.index ["id", "type"], name: "index_spree_promotion_actions_on_id_and_type", using: :btree
    t.index ["promotion_id"], name: "index_spree_promotion_actions_on_promotion_id", using: :btree
  end

  create_table "spree_promotion_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "spree_promotion_code_batches", force: :cascade do |t|
    t.integer  "promotion_id",                        null: false
    t.string   "base_code",                           null: false
    t.integer  "number_of_codes",                     null: false
    t.string   "email"
    t.string   "error"
    t.string   "state",           default: "pending"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["promotion_id"], name: "index_spree_promotion_code_batches_on_promotion_id", using: :btree
  end

  create_table "spree_promotion_codes", force: :cascade do |t|
    t.integer  "promotion_id",            null: false
    t.string   "value",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promotion_code_batch_id"
    t.index ["promotion_code_batch_id"], name: "index_spree_promotion_codes_on_promotion_code_batch_id", using: :btree
    t.index ["promotion_id"], name: "index_spree_promotion_codes_on_promotion_id", using: :btree
    t.index ["value"], name: "index_spree_promotion_codes_on_value", unique: true, using: :btree
  end

  create_table "spree_promotion_rule_taxons", force: :cascade do |t|
    t.integer  "taxon_id"
    t.integer  "promotion_rule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["promotion_rule_id"], name: "index_spree_promotion_rule_taxons_on_promotion_rule_id", using: :btree
    t.index ["taxon_id"], name: "index_spree_promotion_rule_taxons_on_taxon_id", using: :btree
  end

  create_table "spree_promotion_rules", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "product_group_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.text     "preferences"
    t.index ["product_group_id"], name: "index_promotion_rules_on_product_group_id", using: :btree
    t.index ["promotion_id"], name: "index_spree_promotion_rules_on_promotion_id", using: :btree
  end

  create_table "spree_promotion_rules_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "promotion_rule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id", using: :btree
    t.index ["user_id"], name: "index_promotion_rules_users_on_user_id", using: :btree
  end

  create_table "spree_promotions", force: :cascade do |t|
    t.string   "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string   "name"
    t.string   "type"
    t.integer  "usage_limit"
    t.string   "match_policy",          default: "all"
    t.string   "code"
    t.boolean  "advertise",             default: false
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promotion_category_id"
    t.integer  "per_code_usage_limit"
    t.boolean  "apply_automatically",   default: false
    t.index ["advertise"], name: "index_spree_promotions_on_advertise", using: :btree
    t.index ["apply_automatically"], name: "index_spree_promotions_on_apply_automatically", using: :btree
    t.index ["code"], name: "index_spree_promotions_on_code", using: :btree
    t.index ["expires_at"], name: "index_spree_promotions_on_expires_at", using: :btree
    t.index ["id", "type"], name: "index_spree_promotions_on_id_and_type", using: :btree
    t.index ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id", using: :btree
    t.index ["starts_at"], name: "index_spree_promotions_on_starts_at", using: :btree
  end

  create_table "spree_properties", force: :cascade do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_property_prototypes", force: :cascade do |t|
    t.integer  "prototype_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_prototype_taxons", force: :cascade do |t|
    t.integer  "taxon_id"
    t.integer  "prototype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["prototype_id"], name: "index_spree_prototype_taxons_on_prototype_id", using: :btree
    t.index ["taxon_id"], name: "index_spree_prototype_taxons_on_taxon_id", using: :btree
  end

  create_table "spree_prototypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_refund_reasons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "spree_refunds", force: :cascade do |t|
    t.integer  "payment_id"
    t.decimal  "amount",           precision: 10, scale: 2, default: "0.0", null: false
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "refund_reason_id"
    t.integer  "reimbursement_id"
    t.index ["payment_id"], name: "index_spree_refunds_on_payment_id", using: :btree
    t.index ["refund_reason_id"], name: "index_refunds_on_refund_reason_id", using: :btree
    t.index ["reimbursement_id"], name: "index_spree_refunds_on_reimbursement_id", using: :btree
  end

  create_table "spree_reimbursement_credits", force: :cascade do |t|
    t.decimal  "amount",           precision: 10, scale: 2, default: "0.0", null: false
    t.integer  "reimbursement_id"
    t.integer  "creditable_id"
    t.string   "creditable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_reimbursement_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.index ["type"], name: "index_spree_reimbursement_types_on_type", using: :btree
  end

  create_table "spree_reimbursements", force: :cascade do |t|
    t.string   "number"
    t.string   "reimbursement_status"
    t.integer  "customer_return_id"
    t.integer  "order_id"
    t.decimal  "total",                precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["customer_return_id"], name: "index_spree_reimbursements_on_customer_return_id", using: :btree
    t.index ["order_id"], name: "index_spree_reimbursements_on_order_id", using: :btree
  end

  create_table "spree_return_authorizations", force: :cascade do |t|
    t.string   "number"
    t.string   "state"
    t.integer  "order_id"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.integer  "return_reason_id"
    t.index ["return_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id", using: :btree
  end

  create_table "spree_return_items", force: :cascade do |t|
    t.integer  "return_authorization_id"
    t.integer  "inventory_unit_id"
    t.integer  "exchange_variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",                          precision: 12, scale: 4, default: "0.0", null: false
    t.decimal  "included_tax_total",              precision: 12, scale: 4, default: "0.0", null: false
    t.decimal  "additional_tax_total",            precision: 12, scale: 4, default: "0.0", null: false
    t.string   "reception_status"
    t.string   "acceptance_status"
    t.integer  "customer_return_id"
    t.integer  "reimbursement_id"
    t.integer  "exchange_inventory_unit_id"
    t.text     "acceptance_status_errors"
    t.integer  "preferred_reimbursement_type_id"
    t.integer  "override_reimbursement_type_id"
    t.boolean  "resellable",                                               default: true,  null: false
    t.integer  "return_reason_id"
    t.index ["customer_return_id"], name: "index_return_items_on_customer_return_id", using: :btree
    t.index ["exchange_inventory_unit_id"], name: "index_spree_return_items_on_exchange_inventory_unit_id", using: :btree
  end

  create_table "spree_return_reasons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_roles_users", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["role_id"], name: "index_spree_roles_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_spree_roles_users_on_user_id", using: :btree
  end

  create_table "spree_shipments", force: :cascade do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",                  precision: 10, scale: 2, default: "0.0"
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "deprecated_address_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.decimal  "adjustment_total",      precision: 10, scale: 2, default: "0.0"
    t.decimal  "additional_tax_total",  precision: 10, scale: 2, default: "0.0"
    t.decimal  "promo_total",           precision: 10, scale: 2, default: "0.0"
    t.decimal  "included_tax_total",    precision: 10, scale: 2, default: "0.0", null: false
    t.index ["deprecated_address_id"], name: "index_spree_shipments_on_deprecated_address_id", using: :btree
    t.index ["number"], name: "index_shipments_on_number", using: :btree
    t.index ["order_id"], name: "index_spree_shipments_on_order_id", using: :btree
    t.index ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id", using: :btree
  end

  create_table "spree_shipping_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_shipping_method_categories", force: :cascade do |t|
    t.integer  "shipping_method_id",   null: false
    t.integer  "shipping_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true, using: :btree
    t.index ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id", using: :btree
  end

  create_table "spree_shipping_method_stock_locations", force: :cascade do |t|
    t.integer  "shipping_method_id"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shipping_method_id"], name: "shipping_method_id_spree_sm_sl", using: :btree
    t.index ["stock_location_id"], name: "sstock_location_id_spree_sm_sl", using: :btree
  end

  create_table "spree_shipping_method_zones", force: :cascade do |t|
    t.integer  "shipping_method_id"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_shipping_methods", force: :cascade do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tracking_url"
    t.string   "admin_name"
    t.integer  "tax_category_id"
    t.string   "code"
    t.boolean  "available_to_all",   default: true
    t.string   "carrier"
    t.string   "service_level"
    t.boolean  "available_to_users", default: true
    t.index ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id", using: :btree
  end

  create_table "spree_shipping_rate_taxes", force: :cascade do |t|
    t.decimal  "amount",           precision: 8, scale: 2, default: "0.0", null: false
    t.integer  "tax_rate_id"
    t.integer  "shipping_rate_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.index ["shipping_rate_id"], name: "index_spree_shipping_rate_taxes_on_shipping_rate_id", using: :btree
    t.index ["tax_rate_id"], name: "index_spree_shipping_rate_taxes_on_tax_rate_id", using: :btree
  end

  create_table "spree_shipping_rates", force: :cascade do |t|
    t.integer  "shipment_id"
    t.integer  "shipping_method_id"
    t.boolean  "selected",                                   default: false
    t.decimal  "cost",               precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tax_rate_id"
    t.index ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true, using: :btree
  end

  create_table "spree_state_changes", force: :cascade do |t|
    t.string   "name"
    t.string   "previous_state"
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.string   "stateful_type"
    t.string   "next_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["stateful_id", "stateful_type"], name: "index_spree_state_changes_on_stateful_id_and_stateful_type", using: :btree
    t.index ["user_id"], name: "index_spree_state_changes_on_user_id", using: :btree
  end

  create_table "spree_states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["country_id"], name: "index_spree_states_on_country_id", using: :btree
  end

  create_table "spree_stock_items", force: :cascade do |t|
    t.integer  "stock_location_id"
    t.integer  "variant_id"
    t.integer  "count_on_hand",     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "backorderable",     default: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_spree_stock_items_on_deleted_at", using: :btree
    t.index ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id", using: :btree
    t.index ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id", using: :btree
    t.index ["variant_id", "stock_location_id"], name: "index_spree_stock_items_on_variant_id_and_stock_location_id", unique: true, where: "(deleted_at IS NULL)", using: :btree
  end

  create_table "spree_stock_locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",                 default: false, null: false
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "state_name"
    t.integer  "country_id"
    t.string   "zipcode"
    t.string   "phone"
    t.boolean  "active",                  default: true
    t.boolean  "backorderable_default",   default: false
    t.boolean  "propagate_all_variants",  default: true
    t.string   "admin_name"
    t.integer  "position",                default: 0
    t.boolean  "restock_inventory",       default: true,  null: false
    t.boolean  "fulfillable",             default: true,  null: false
    t.string   "code"
    t.boolean  "check_stock_on_transfer", default: true
    t.index ["country_id"], name: "index_spree_stock_locations_on_country_id", using: :btree
    t.index ["state_id"], name: "index_spree_stock_locations_on_state_id", using: :btree
  end

  create_table "spree_stock_movements", force: :cascade do |t|
    t.integer  "stock_item_id"
    t.integer  "quantity",        default: 0
    t.string   "action"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "originator_type"
    t.integer  "originator_id"
    t.index ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id", using: :btree
  end

  create_table "spree_stock_transfers", force: :cascade do |t|
    t.string   "description"
    t.integer  "source_location_id"
    t.integer  "destination_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.datetime "shipped_at"
    t.datetime "closed_at"
    t.string   "tracking_number"
    t.integer  "created_by_id"
    t.integer  "closed_by_id"
    t.datetime "finalized_at"
    t.integer  "finalized_by_id"
    t.datetime "deleted_at"
    t.index ["closed_at"], name: "index_spree_stock_transfers_on_closed_at", using: :btree
    t.index ["destination_location_id"], name: "index_spree_stock_transfers_on_destination_location_id", using: :btree
    t.index ["finalized_at"], name: "index_spree_stock_transfers_on_finalized_at", using: :btree
    t.index ["number"], name: "index_spree_stock_transfers_on_number", using: :btree
    t.index ["shipped_at"], name: "index_spree_stock_transfers_on_shipped_at", using: :btree
    t.index ["source_location_id"], name: "index_spree_stock_transfers_on_source_location_id", using: :btree
  end

  create_table "spree_store_credit_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_store_credit_events", force: :cascade do |t|
    t.integer  "store_credit_id",                                            null: false
    t.string   "action",                                                     null: false
    t.decimal  "amount",             precision: 8, scale: 2
    t.decimal  "user_total_amount",  precision: 8, scale: 2, default: "0.0", null: false
    t.string   "authorization_code",                                         null: false
    t.datetime "deleted_at"
    t.string   "originator_type"
    t.integer  "originator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "update_reason_id"
    t.index ["deleted_at"], name: "index_spree_store_credit_events_on_deleted_at", using: :btree
    t.index ["store_credit_id"], name: "index_spree_store_credit_events_on_store_credit_id", using: :btree
  end

  create_table "spree_store_credit_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority"], name: "index_spree_store_credit_types_on_priority", using: :btree
  end

  create_table "spree_store_credit_update_reasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_store_credits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "created_by_id"
    t.decimal  "amount",            precision: 8, scale: 2, default: "0.0", null: false
    t.decimal  "amount_used",       precision: 8, scale: 2, default: "0.0", null: false
    t.decimal  "amount_authorized", precision: 8, scale: 2, default: "0.0", null: false
    t.string   "currency"
    t.text     "memo"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
    t.datetime "invalidated_at"
    t.index ["deleted_at"], name: "index_spree_store_credits_on_deleted_at", using: :btree
    t.index ["type_id"], name: "index_spree_store_credits_on_type_id", using: :btree
    t.index ["user_id"], name: "index_spree_store_credits_on_user_id", using: :btree
  end

  create_table "spree_store_payment_methods", force: :cascade do |t|
    t.integer  "store_id",          null: false
    t.integer  "payment_method_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["payment_method_id"], name: "index_spree_store_payment_methods_on_payment_method_id", using: :btree
    t.index ["store_id"], name: "index_spree_store_payment_methods_on_store_id", using: :btree
  end

  create_table "spree_stores", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "seo_title"
    t.string   "mail_from_address"
    t.string   "default_currency"
    t.string   "code"
    t.boolean  "default",              default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cart_tax_country_iso"
    t.index ["code"], name: "index_spree_stores_on_code", using: :btree
    t.index ["default"], name: "index_spree_stores_on_default", using: :btree
  end

  create_table "spree_tax_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_default",  default: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tax_code"
  end

  create_table "spree_tax_rates", force: :cascade do |t|
    t.decimal  "amount",             precision: 8, scale: 5
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.boolean  "included_in_price",                          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "show_rate_in_label",                         default: true
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at", using: :btree
    t.index ["tax_category_id"], name: "index_spree_tax_rates_on_tax_category_id", using: :btree
    t.index ["zone_id"], name: "index_spree_tax_rates_on_zone_id", using: :btree
  end

  create_table "spree_taxonomies", force: :cascade do |t|
    t.string   "name",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",   default: 0
    t.index ["position"], name: "index_spree_taxonomies_on_position", using: :btree
  end

  create_table "spree_taxons", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "position",          default: 0
    t.string   "name",                          null: false
    t.string   "permalink"
    t.integer  "taxonomy_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "depth"
    t.index ["parent_id"], name: "index_taxons_on_parent_id", using: :btree
    t.index ["permalink"], name: "index_taxons_on_permalink", using: :btree
    t.index ["position"], name: "index_spree_taxons_on_position", using: :btree
    t.index ["taxonomy_id"], name: "index_taxons_on_taxonomy_id", using: :btree
  end

  create_table "spree_transfer_items", force: :cascade do |t|
    t.integer  "variant_id",                    null: false
    t.integer  "stock_transfer_id",             null: false
    t.integer  "expected_quantity", default: 0, null: false
    t.integer  "received_quantity", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.index ["stock_transfer_id"], name: "index_spree_transfer_items_on_stock_transfer_id", using: :btree
    t.index ["variant_id"], name: "index_spree_transfer_items_on_variant_id", using: :btree
  end

  create_table "spree_unit_cancels", force: :cascade do |t|
    t.integer  "inventory_unit_id", null: false
    t.string   "reason"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["inventory_unit_id"], name: "index_spree_unit_cancels_on_inventory_unit_id", using: :btree
  end

  create_table "spree_user_addresses", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "address_id",                 null: false
    t.boolean  "default",    default: false
    t.boolean  "archived",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["address_id"], name: "index_spree_user_addresses_on_address_id", using: :btree
    t.index ["user_id", "address_id"], name: "index_spree_user_addresses_on_user_id_and_address_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_spree_user_addresses_on_user_id", using: :btree
  end

  create_table "spree_user_stock_locations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_spree_user_stock_locations_on_user_id", using: :btree
  end

  create_table "spree_users", force: :cascade do |t|
    t.string   "encrypted_password",     limit: 128
    t.string   "password_salt",          limit: 128
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                      default: 0, null: false
    t.integer  "failed_attempts",                    default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spree_api_key",          limit: 48
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["deleted_at"], name: "index_spree_users_on_deleted_at", using: :btree
    t.index ["email"], name: "email_idx_unique", unique: true, using: :btree
    t.index ["spree_api_key"], name: "index_spree_users_on_spree_api_key", using: :btree
  end

  create_table "spree_variant_property_rule_conditions", force: :cascade do |t|
    t.integer  "option_value_id"
    t.integer  "variant_property_rule_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["variant_property_rule_id", "option_value_id"], name: "index_spree_variant_prop_rule_conditions_on_rule_and_optval", using: :btree
  end

  create_table "spree_variant_property_rule_values", force: :cascade do |t|
    t.text     "value"
    t.integer  "position",                 default: 0
    t.integer  "property_id"
    t.integer  "variant_property_rule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["property_id"], name: "index_spree_variant_property_rule_values_on_property_id", using: :btree
    t.index ["variant_property_rule_id"], name: "index_spree_variant_property_rule_values_on_rule", using: :btree
  end

  create_table "spree_variant_property_rules", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_spree_variant_property_rules_on_product_id", using: :btree
  end

  create_table "spree_variants", force: :cascade do |t|
    t.string   "sku",                                      default: "",    null: false
    t.decimal  "weight",          precision: 8,  scale: 2, default: "0.0"
    t.decimal  "height",          precision: 8,  scale: 2
    t.decimal  "width",           precision: 8,  scale: 2
    t.decimal  "depth",           precision: 8,  scale: 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                default: false
    t.integer  "product_id"
    t.decimal  "cost_price",      precision: 10, scale: 2
    t.integer  "position"
    t.string   "cost_currency"
    t.boolean  "track_inventory",                          default: true
    t.integer  "tax_category_id"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["position"], name: "index_spree_variants_on_position", using: :btree
    t.index ["product_id"], name: "index_spree_variants_on_product_id", using: :btree
    t.index ["sku"], name: "index_spree_variants_on_sku", using: :btree
    t.index ["tax_category_id"], name: "index_spree_variants_on_tax_category_id", using: :btree
    t.index ["track_inventory"], name: "index_spree_variants_on_track_inventory", using: :btree
  end

  create_table "spree_wallet_payment_sources", force: :cascade do |t|
    t.integer  "user_id",                             null: false
    t.string   "payment_source_type",                 null: false
    t.integer  "payment_source_id",                   null: false
    t.boolean  "default",             default: false, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id", "payment_source_id", "payment_source_type"], name: "index_spree_wallet_payment_sources_on_source_and_user", unique: true, using: :btree
    t.index ["user_id"], name: "index_spree_wallet_payment_sources_on_user_id", using: :btree
  end

  create_table "spree_zone_members", force: :cascade do |t|
    t.string   "zoneable_type"
    t.integer  "zoneable_id"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["zone_id"], name: "index_spree_zone_members_on_zone_id", using: :btree
    t.index ["zoneable_id", "zoneable_type"], name: "index_spree_zone_members_on_zoneable_id_and_zoneable_type", using: :btree
  end

  create_table "spree_zones", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default_tax",        default: false
    t.integer  "zone_members_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "spree_adjustments", "spree_orders", column: "order_id", name: "fk_spree_adjustments_order_id", on_update: :restrict, on_delete: :restrict
  add_foreign_key "spree_product_promotion_rules", "spree_products", column: "product_id"
  add_foreign_key "spree_product_promotion_rules", "spree_promotion_rules", column: "promotion_rule_id"
  add_foreign_key "spree_promotion_code_batches", "spree_promotions", column: "promotion_id"
  add_foreign_key "spree_promotion_codes", "spree_promotion_code_batches", column: "promotion_code_batch_id"
  add_foreign_key "spree_prototype_taxons", "spree_prototypes", column: "prototype_id"
  add_foreign_key "spree_prototype_taxons", "spree_taxons", column: "taxon_id"
  add_foreign_key "spree_shipping_method_stock_locations", "spree_shipping_methods", column: "shipping_method_id"
  add_foreign_key "spree_shipping_method_stock_locations", "spree_stock_locations", column: "stock_location_id"
  add_foreign_key "spree_wallet_payment_sources", "spree_users", column: "user_id"
end
