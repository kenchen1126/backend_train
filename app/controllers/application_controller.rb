class ApplicationController < ActionController::Base
  before_action :login_verify, :set_ransack_obj
  
  def set_ransack_obj
    @q = Task.ransack(params[:q])
  end

  def login_verify
    if session[:user_id].present? 
      @current_user = User.find(session[:user_id])
    else
      redirect_to login_path
    end
  end

  def admin_user?
    @current_user.authority == "admin"
  end

  def check_authority
    redirect_to tasks_path, notice: I18n.t("user.no_authority") if !admin_user?
  end

end
