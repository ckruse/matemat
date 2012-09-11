# -*- coding: utf-8 -*-

class PizzasController < ApplicationController
  before_filter :require_login, only: [:edit, :update]

  def index
    @orders = Order.find :all
  end

  def show
    @order = Order.includes(:order_positions, :pizzeria).find params[:id]
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new params[:order]

    respond_to do |format|
      if @order.save
        format.html { redirect_to pizza_path(@order), notice: I18n.t('pizzas.created_successfully') }
        format.json { render json: @order, :status => :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, :status => :unprocessable_entity }
      end
    end
  end

end

# eof
