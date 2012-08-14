# -*- encoding: utf-8 -*-

class Account < ActiveRecord::Base
  self.primary_key = 'account_id'

  attr_accessible :account_id, :user_id

  belongs_to :user
  has_many :bookings, :dependent => :destroy
end

# eof
