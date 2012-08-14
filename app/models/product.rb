# -*- encoding: utf-8 -*-

class Product < ActiveRecord::Base
  self.primary_key = 'product_id'

  attr_accessible :product_id, :name, :price_chf,
    :price_eur

  has_many :bookings
end

# eof