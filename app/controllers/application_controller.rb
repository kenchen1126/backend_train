class ApplicationController < ActionController::Base
  

  private 
  def set_ransack_obj
    @q = Task.ransack(params[:q])
  end
end
