# -*- encoding: utf-8 -*-

class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:username], params[:password])
        format.html { redirect_back_or_to :users, :notice => I18n.t('user_sessions.login_success') }
      else
        format.html do
          flash.now[:alert] = I18n.t('user_sessions.login_failed')
          render :action => "new"
        end
      end

    end
  end

  def destroy
    logout
    redirect_to(:users, :notice => 'Logged out!')
  end
end

# eof
