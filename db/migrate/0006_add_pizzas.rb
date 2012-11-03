# -*- encoding: utf-8 -*-

class AddPizzas < ActiveRecord::Migration
  def up
    create_table :pizzerias, :primary_key => :pizzeria_id do |t|
      t.string :name, null: false
      t.string :business_hours, null: false
      t.string :email
      t.timestamps
    end

    create_table :pizzas, :primary_key => :pizza_id do |t|
      t.integer :pizzeria_id, null: false

      t.string :name, null: false
      t.decimal :price, null: false, precision: 8, scale: 2, default: 0
      t.string :ingredients
    end

    create_table :orders, :primary_key => :order_id do |t|
      t.integer :pizzeria_id, null: false
      t.boolean :open, default: true, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    create_table :order_positions, :primary_key => :position_id do |t|
      t.string :name
      t.decimal :price, null: false, precision: 8, scale: 2, default: 0
      t.boolean :paid, default: false, null: false

      t.integer :order_id
      t.integer :user_id

      t.timestamps
    end

  end

  def down
    drop_table :order_positions
    drop_table :orders
    drop_table :pizzas
    drop_table :pizzerias
  end
end

# eof
