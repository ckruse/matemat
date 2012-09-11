# -*- encoding: utf-8 -*-

class Pizza < ActiveRecord::Base
  self.primary_key = 'pizza_id'

  attr_accessible :pizza_id, :pizzeria_id, :name, :price, :ingredients
  belongs_to :pizzeria
end

# eof
