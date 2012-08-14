# -*- encoding: utf-8 -*-

class UsersController < ApplicationController
  def index
    @users = User.includes(:account).find :all
    bookings = Booking.select('account_id, SUM(value) AS value, MAX(updated_at) AS last').where('account_id IN (SELECT account_id FROM accounts INNER JOIN users USING(user_id))').group(:account_id)

    @bookings = {}
    @activities = {}
    bookings.each do |b|
      @bookings[b.account_id] = b.value
      @activities[b.account_id] = DateTime.parse(b.last)
    end
  end

  def show
    @user = User.find params[:id]
    @account = Account.
      select('accounts.*, SUM(value) AS sum').
      joins('LEFT JOIN bookings USING(account_id)').
      group('accounts.account_id').
      find_by_user_id(@user.user_id) || @account = Account.new

    @products = Product.
      select('products.*, count(bookings.booking_id) AS cnt').
      joins("LEFT JOIN bookings ON bookings.product_id = products.product_id AND bookings.account_id = #{@account.account_id}").
      group('products.product_id').
      find :all

  end
end

# eof
