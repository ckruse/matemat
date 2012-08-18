# -*- encoding: utf-8 -*-

class Admin::BookingsController < ApplicationController
  before_filter :require_login, :authorize_admin

  def new
    @user = User.find(params[:user_id])
    @account = Account.find_by_user_id(@user.user_id)
    @products = Product.find :all
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @account = Account.find_by_user_id(@user.user_id)
    @products = Product.find :all

    @booking = Booking.new(params[:booking])
    @booking.account_id = @account.account_id

    if params[:amount] and @booking.product_id
      product = Product.find @booking.product_id
      @booking.value = -(params[:amount].to_i * product.price_int)
    end

    respond_to do |format|
      if @booking.save
        format.html { redirect_to admin_user_url(@user), notice: I18n.t('admin.users.bookings.successfully_created') }
        format.json { render json: @booking, :status => :created, location: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @user = User.find(params[:user_id])

    @booking.destroy

    respond_to do |format|
      format.html { redirect_to admin_user_url(@user), notice: I18n.t('admin.users.bookings.successfully_deleted') }
      format.json { head :no_content }
    end
  end
end

# eof
