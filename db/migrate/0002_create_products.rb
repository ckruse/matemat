# -*- encoding: utf-8 -*-

class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products, :primary_key => :product_id do |t|
      t.string :name, null: false

      t.decimal :price_int, null: false, precision: 8, scale: 2, default: 0
      t.decimal :price_ext, null: false, precision: 8, scale: 2, default: 0
      t.decimal :deposit, null: false, precision: 8, scale: 2, default: 0

      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end

# eof
