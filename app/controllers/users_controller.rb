# -*- encoding: utf-8 -*-

class UsersController < ApplicationController
  before_filter :require_login, only: [:edit, :update]

  def touch_login
    @user = User.find params[:id]
  end

  def do_touch_login
    if @user = login(params[:username], params[:password])
      redirect_to user_url(@user)
    else
      flash[:error] = 'Falsche Nutzerdaten!'
      @user = User.find_by_username params[:username]
      render :touch_login
    end
  end

  def index
    @users = User.find :all
  end

  def show
    unless current_user
      redirect_to touch_login_url(id: params[:id]), alert: I18n.t('login_first')
      return
    end

    @user = User.find params[:id]
    @account = Account.find_by_user_id(@user.user_id) || Account.new

    if @account.new_record?
      @account.user_id = @user.user_id
      @account.save!
    end

    @account = Account.
      select('accounts.*, SUM(value) AS sum').
      joins('LEFT JOIN bookings USING(account_id)').
      group('accounts.account_id').
      find_by_user_id(@user.user_id)

    @products = Product.
      select('products.*, count(bookings.booking_id) AS cnt').
      joins("LEFT JOIN bookings ON bookings.product_id = products.product_id AND bookings.account_id = #{@account.account_id}").
      group('products.product_id').
      find :all

  end

  def edit
    @user = User.find params[:id]
    redirect_to(root_url, alert: I18n.t('authorize_first')) if current_user.blank? or current_user.user_id != @user.user_id
  end

  def update
    @user = User.find params[:id]
    redirect_to(root_url, alert: I18n.t('authorize_first')) if current_user.blank? or current_user.user_id != @user.user_id

    @user.password = params[:user][:password]
    @user.avatar = params[:user][:avatar] if params[:user][:avatar]

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: I18n.t('users.password_changed') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end

# eof
