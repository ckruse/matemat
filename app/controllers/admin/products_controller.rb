# -*- encoding: utf-8 -*-

class Admin::ProductsController < ApplicationController
  before_filter :require_login, :authorize_admin

  def index
    @products = Product.find :all
  end

  def show
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product), notice: I18n.t('admin.products.successfully_created') }
        format.json { render json: @product, :status => :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to admin_product_url(@product), notice: I18n.t('admin.products.successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: I18n.t('admin.products.successfully_deleted') }
      format.json { head :no_content }
    end
  end
end

# eof
