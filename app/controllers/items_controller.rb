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
    @item.order = Order.includes(:pizzeria => :pizzas).find(params[:order_id])

    respond_to do |format|
      if @order.save
        format.html { redirect_to pizza_path(@order), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
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
      format.html { redirect_to pizzas_url }
      format.json { head :no_content }
    end
  end
end

# eof
