# -*- coding: utf-8 -*-

class Admin::PizzasController < ApplicationController
  before_filter :require_login, :authorize_admin

  def index
    @pizzeria = Pizzeria.include(:pizzas).find params[:pizzeria_id]
  end

  def show
    @pizza = Pizza.find params[:id]
  end

  def new
    @pizzeria = Pizzeria.find params[:pizzeria_id]
    @pizza = Pizza.new
  end

  def create
    @pizzeria = Pizzeria.find params[:pizzeria_id]
    @pizza = Pizza.new(params[:pizza])
    @pizza.pizzeria_id = @pizzeria.pizzeria_id

    respond_to do |format|
      if @pizza.save
        format.html { redirect_to admin_pizzeria_url(@pizzeria), notice: I18n.t('admin.pizzeria.pizza.successfully_created') }
        format.json { render json: @pizza, :status => :created, location: @pizza }
      else
        format.html { render action: "new" }
        format.json { render json: @pizza.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @pizza = Pizza.find params[:id]
    @pizzeria = Pizzeria.find params[:pizzeria_id]
  end

  def update
    @pizzeria = Pizzeria.find(params[:pizzeria_id])
    @pizza = Pizza.find params[:id]

    respond_to do |format|
      if @pizza.update_attributes(params[:pizza])
        format.html { redirect_to admin_pizzeria_url(@pizzeria), notice: I18n.t('admin.pizzeria.pizza.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pizza.errors, :status => :unprocessable_entity }
      end
    end

  end

  def destroy
    @pizzeria = Pizzeria.find params[:pizzeria_id]
    @pizza = Pizza.find params[:id]
    @pizza.destroy

    respond_to do |format|
      format.html { redirect_to admin_pizzeria_url(@pizzeria), notice: I18n.t('admin.pizzerias.pizza.successfully_deleted') }
      format.json { head :no_content }
    end
  end
end

# eof
