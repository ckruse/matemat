# -*- encoding: utf-8 -*-

class BookingsController < ApplicationController
  def create
    @user = User.find params[:user_id]
    @account = Account.find_by_user_id @user.user_id
    @product = Product.find params[:product_id]

    @booking = Booking.create! account_id: @account.account_id,
      product_id: @product.product_id,
      value: -@product.price_int

    respond_to do |format|
      format.html { redirect_to user_url(@user), notice: I18n.t('bookings.created') }
      format.json { render json: @booking, :status => :created, location: @user }
    end
  end
end

# eof
