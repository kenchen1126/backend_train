class SessionsController < ApplicationController
  skip_before_action :login_verify
  before_action :find_user, only: [:create]
  def new
    @user = User.new
  end

  def create
    byebug
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = I18n.t("session.login_success")
      redirect_to tasks_path(@user)
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
    @user = User.find_by(email: params[:user][:email])
  end
end
