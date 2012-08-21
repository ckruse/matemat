# -*- encoding: utf-8 -*-

class AddIsMember < ActiveRecord::Migration
  def up
    add_column :users, :is_member, :boolean, default: true
  end

  def down
    remove_column :users, :is_member
  end
end

# eof
