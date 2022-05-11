ActiveRecord::Schema[7.0].define(version: 2022_05_10_160749) do
  create_table "suppliers", force: :cascade do |t|
    t.string "corporate_name"
    t.string "brand_name"
    t.integer "registration_number"
    t.string "full_address"
    t.string "city"
    t.string "state"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "city"
    t.integer "area"
    t.string "cep"
    t.string "description"
    t.string "address"
  end

end
