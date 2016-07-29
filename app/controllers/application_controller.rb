class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def require_login
    #check if the user is logged in or not
    unless logged_in?
      flash[:danger] = "Please log in first!"
      redirect_to '/login' # halts request cycle
    end
  end




end
