# -*- encoding: utf-8 -*-

class CreateAccountsBookings < ActiveRecord::Migration
  def up
    create_table :accounts, :primary_key => :account_id do |t|
      t.integer :user_id, null: false, unique: true
      t.timestamps
    end

    create_table :bookings, :primary_key => :booking_id do |t|
      t.integer :account_id, null: false
      t.integer :product_id
      t.decimal :value, null: false, precision: 8, scale: 2

      t.timestamps
    end
  end

  def down
    drop_table :bookings
    drop_table :accounts
  end
end

# eof
