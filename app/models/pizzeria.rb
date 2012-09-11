# -*- coding: utf-8 -*-

class Pizzeria < ActiveRecord::Base
  self.primary_key = 'pizzeria_id'
  self.table_name = 'pizzerias'

  attr_accessible :pizzeria_id, :name, :business_hours,
    :email, :created_at, :updated_at

  has_many :pizzas, :dependent => :destroy
  has_many :orders, :dependent => :destroy
end

# eof
