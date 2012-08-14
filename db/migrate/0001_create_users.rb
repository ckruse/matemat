# -*- encoding: utf-8 -*-

class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users, :primary_key => :user_id do |t|
      t.string :username, null: false, unique: true
      t.string :display_name, null: false
      t.string :email, null: false

      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end

# eof
