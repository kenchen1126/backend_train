class UsersController < ApplicationController
  layout false
  skip_before_action :login_verify
  def index
    @user = User.new
  end

  def show
    @user = User.new
  end

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

  def edit
  end

  def update
    if @user.update(task_params)
      flash[:notice] = I18n.t("user.edit_success")
      redirect_to tasks_path
    else
      render :edit 
      flash[:notice] = I18n.t("user.edit_failed")
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = I18n.t("user.delete_success")
    else
      flash[:notice] = I18n.t("user.delete_failed")
    end
    redirect_to tasks_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
