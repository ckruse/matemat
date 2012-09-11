# -*- coding: utf-8 -*-

class OrderPosition < ActiveRecord::Base
  self.primary_key = 'position_id'

  attr_accessible :position_id, :name, :price, :paid, :order_id
  belongs_to :order
end

# eof
