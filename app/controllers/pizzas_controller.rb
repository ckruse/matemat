# -*- encoding: utf-8 -*-

class PizzasController < ApplicationController
  before_filter :require_login, only: [:update, :destroy]

  def index
    @orders = Order.includes(:pizzas).find :all
  end

  def show
    @order = Order.includes(:pizzas).find params[:id]
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end

# eof
