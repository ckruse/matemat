# -*- encoding: utf-8 -*-

class Product < ActiveRecord::Base
  self.primary_key = 'product_id'

  attr_accessible :product_id, :name, :price_int,
    :price_ext, :deposit

  has_many :bookings

  validates :name, presence: true, length: {in: 3..50}
  validates :price_int, presence: true, numericality: true
  validates :price_ext, presence: true, numericality: true
  validates :deposit, presence: true, numericality: true
end

# eof
