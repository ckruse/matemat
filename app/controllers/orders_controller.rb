# -*- coding: utf-8 -*-

class OrdersController < ApplicationController
  # GET /collections
  # GET /collections.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @order = Order.includes(:order_positions, :pizzeria => :pizzas).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /collections/new
  # GET /collections/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /collections/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /collections
  # POST /collections.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: I18n.t('orders.successfully_created') }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to order_url(@order), notice: I18n.t('orders.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: I18n.t('orders.successfully_deleted') }
      format.json { head :no_content }
    end
  end
end

# eof
