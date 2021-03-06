class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def require_signin
  	unless current_user
  		session[:intended_url] = request.url #puts request url into session hash with key :intended_url
  		redirect_to new_session_path, notice: "Sign in first"
  	end
  end

  def current_user
		User.find(session[:user_id]) if session[:user_id]
	end

	def current_user?(user)
		current_user == user
	end

	def require_admin
		unless current_user_admin?
  		redirect_to root_path, notice: "Sign in as admin required"
  	end
 	end

 	def current_user_admin?
 		current_user && current_user.admin?
 	end

	helper_method :current_user
	helper_method :current_user?
	helper_method :current_user_admin?
	

end
