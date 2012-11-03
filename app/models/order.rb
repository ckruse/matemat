# -*- coding: utf-8 -*-

class Order < ActiveRecord::Base
  self.primary_key = 'order_id'

  attr_accessible :order_id, :pizzeria_id, :user_id, :open, :created_at, :updated_at
  has_many :order_positions, :dependent => :destroy
  belongs_to :pizzeria
  belongs_to :user
end

# eof
