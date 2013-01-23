# -*- encoding: utf-8 -*-

class User < ActiveRecord::Base
  authenticates_with_sorcery!

  self.primary_key = 'user_id'

  attr_accessible :user_id, :username, :display_name,
    :email, :created_at, :updated_at, :password, :admin,
    :is_member, :password_confirmation, :last_login_at,
    :last_logout_at, :last_activity_at, :avatar

  has_one :account, :dependent => :destroy

  validates_confirmation_of :password, :if => :password
  validates_length_of :password, :minimum => 3, :if => :password, :allow_blank => true
  validates_presence_of :password, :on => :create

  validates_presence_of :username
  validates_uniqueness_of :username

  has_attached_file :avatar,
    :styles => { :medium => "100x100>", :thumb => "50x50>" },
    :path => ":rails_root/public/img/avatars/:attachment/:id/:style/:filename",
    :url => "/img/avatars/:attachment/:id/:style/:filename"
end

# eof
