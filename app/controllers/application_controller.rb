class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize_admin
    usr = current_user
    redirect_to(root_url, alert: I18n.t('login_first') if usr.blank?
    redirect_to(root_url, alert: I18n.t('authorize_first')) if !usr.blank? and !usr.admin
  end

  protected
  def not_authenticated
    redirect_to root_path, alert: I18n.t('login_first')
  end
end
