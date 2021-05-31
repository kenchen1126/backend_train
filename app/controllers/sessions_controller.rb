class SessionsController < ApplicationController
  skip_before_action :login_verify
  def new
    @user = User.new
  end

  def create
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = I18n.t("session.login_success")
      redirect_to user_tasks_path(@user)
    else
      flash[:notice] = I18n.t("session.login_failed")
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = I18n.t("session.logout")
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find_by(email: params[:session][:email])
  end
end
