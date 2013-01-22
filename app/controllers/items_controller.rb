# -*- coding: utf-8 -*-

class ItemsController < ApplicationController
  # GET /collections
  # GET /collections.json
  def index
    @order = Order.includes(:pizzeria => :pizzas).find(params[:order_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /collections/new
  # GET /collections/new.json
  def new
    @item = OrderPosition.new
    @item.order = Order.includes(:pizzeria => :pizzas).find(params[:order_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # POST /collections
  # POST /collections.json
  def create
    @item = OrderPosition.new(params[:order_position])
    @pizza = Pizza.find params[:pizza_id]
    @item.order = Order.includes(:pizzeria => :pizzas).find(params[:order_id])

    @item.user_id = current_user.user_id

    @item.price = @pizza.price
    @item.name = @pizza.name

    respond_to do |format|
      if @item.save
        format.html { redirect_to order_url(@item.order), notice: I18n.t('orders.pizzas.successfully_created') }
        format.json { render json: @order, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @item = OrderPosition.find(params[:id])

    destroyed = false
    if @item.user_id == current_user.user_id or @item.order.user_id == current_user.user_id
      @item.destroy
      destroyed = true
    end

    respond_to do |format|
      format.html { redirect_to order_url(@item.order), notice: destroyed ?
          I18n.t('orders.pizzas.successfully_deleted') :
          I18n.t('orders.pizzas.not_allowed_to_delete')
      }
      format.json { head :no_content }
    end
  end

  def set_paid
    @item = OrderPosition.includes(:order).find params[:id]

    if current_user.user_id == @item.order.user_id
      @item.paid = true
      @item.save

      redirect_to order_url(@item.order), notice: I18n.t('orders.pizzas.paid')
    end
  end
end

# eof
