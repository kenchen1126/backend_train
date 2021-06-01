class UsersController < ApplicationController
  layout false
  skip_before_action :login_verify

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = I18n.t("user.create_success")
      session[:user_id] = @user.id
      redirect_to tasks_path
    else
      render :new
      flash[:notice] = I18n.t("user.create_failed")
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
