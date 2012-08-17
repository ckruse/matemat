# -*- encoding: utf-8 -*-

class Product < ActiveRecord::Base
  self.primary_key = 'product_id'

  attr_accessible :product_id, :name, :price_chf,
    :price_eur

  has_many :bookings

  validates :name, presence: true, length: {in: 3..50}
  validates :price_chf, presence: true, numericality: true
  validates :price_eur, presence: true, numericality: true
end

# eof
