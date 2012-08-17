# -*- encoding: utf-8 -*-

class AddAdmin < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean, :default => false
  end

  def down
    remove_column :users, :admin
  end
end

# eof
