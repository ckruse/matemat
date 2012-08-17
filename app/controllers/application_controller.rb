class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize_admin
    usr = current_user
    redirect_to(root_url, alert: I18n.t('authorize_first')) if usr.nil? or !usr.admin
  end
end
