# -*- encoding: utf-8 -*-

class Booking < ActiveRecord::Base
  self.primary_key = 'booking_id'

  attr_accessible :booking_id, :account_id, :product_id,
    :value, :created_at, :updated_at

  belongs_to :account
  belongs_to :product
end

# eof
