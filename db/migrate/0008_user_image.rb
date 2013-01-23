# -*- coding: utf-8 -*-

class UserImage < ActiveRecord::Migration
  def self.up
    add_attachment :users, :avatar
  end

  def self.down
    remove_attachment :users, :avatar
  end
end

# eof