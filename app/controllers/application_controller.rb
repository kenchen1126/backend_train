class ApplicationController < ActionController::Base
  before_action :set_ransack_obj

  private 
  def set_ransack_obj
    @q = Task.ransack(params[:q])
  end
end
