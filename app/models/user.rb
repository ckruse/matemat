# -*- encoding: utf-8 -*-

class User < ActiveRecord::Base
  authenticates_with_sorcery!

  self.primary_key = 'user_id'

  attr_accessible :user_id, :username, :display_name,
    :email, :created_at, :updated_at, :password, :admin,
    :password_confirmation

  has_one :account, :dependent => :destroy

  validates_confirmation_of :password, :if => :password
  validates_length_of :password, :minimum => 3, :if => :password, :allow_blank => true
  validates_presence_of :password, :on => :create

  validates_presence_of :username
  validates_uniqueness_of :username
end

# eof
