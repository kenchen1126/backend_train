class Admin::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy, :edit, :switch_authority]
  before_action :check_authority
  def index
    @users = User.page(params[:page]).per(5)
  end

  def show
    @q = @user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = I18n.t("user.create_success")
      redirect_to admin_users_path
    else
      render :new
      flash[:notice] = I18n.t("user.create_failed")
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = I18n.t("user.edit_success")
      redirect_to admin_users_path
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
    redirect_to admin_users_path
  end

  def switch_authority
    if @user.authority == "admin"
      User.admin.size <= 1 ? @user : @user.authority = "member"
    else
      @user.authority = "admin"
    end
    @user.save!
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
