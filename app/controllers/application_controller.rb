# -*- encoding: utf-8 -*-

class ApplicationController < ActionController::Base
  protect_from_forgery

  if Rails.env == 'production'
    rescue_from StandardError, :with => :render_500
    rescue_from ActiveRecord::RecordNotFound, AbstractController::ActionNotFound, :with => :render_404
  end

  def authorize_admin
    usr = current_user
    redirect_to(root_url, alert: I18n.t('login_first')) if usr.blank?
    redirect_to(root_url, alert: I18n.t('authorize_first')) if !usr.blank? and !usr.admin
  end

  def render_500
    respond_to do |format|
      format.html { render template: 'errors/500', status: 500 }
      format.json { render json: {}, status: 500 }
    end
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/404', status: 404 }
      format.json { render json: {}, status: 404 }
    end
  end

  protected
  def not_authenticated
    redirect_to root_path, alert: I18n.t('login_first')
  end
end

# eof
