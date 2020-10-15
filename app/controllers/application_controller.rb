class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def user_logged_in? #Determines if user is logged in by checking to see if session has an existing :user_id.
    !!session[:user_id]
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def record_not_found
    redirect_to root_path
  end

end
