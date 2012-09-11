# -*- coding: utf-8 -*-

class Admin::PizzeriasController < ApplicationController
  before_filter :require_login, :authorize_admin

  def index
    @pizzerias = Pizzeria.find :all
  end

  def show
    @pizzeria = Pizzeria.find params[:id]
  end

  def new
    @pizzeria = Pizzeria.new
  end

  def create
    @pizzeria = Pizzeria.new(params[:pizzeria])

    respond_to do |format|
      if @pizzeria.save
        format.html { redirect_to admin_pizzeria_url(@pizzeria), notice: I18n.t('admin.pizzeria.successfully_created') }
        format.json { render json: @pizzeria, :status => :created, location: @pizzeria }
      else
        format.html { render action: "new" }
        format.json { render json: @pizzeria.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @pizzeria = Pizzeria.find params[:id]
  end

  def update
    @pizzeria = Pizzeria.find(params[:id])

    respond_to do |format|
      if @pizzeria.update_attributes(params[:pizzeria])
        format.html { redirect_to admin_pizzeria_url(@pizzeria), notice: I18n.t('admin.pizzeria.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pizzeria.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @pizzeria = Pizzeria.find(params[:id])
    @pizzeria.destroy

    respond_to do |format|
      format.html { redirect_to admin_pizzerias_url, notice: I18n.t('admin.pizzerias.successfully_deleted') }
      format.json { head :no_content }
    end
  end
end

# eof
