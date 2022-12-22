class ApplicationController < ActionController::Base
  include Pagy::Backend
rescue_from ActiveRecord::RecordNotFound, with: :notfound
private
def notfound()
  render file: 'public/404.html', status: :not_found, layaut: false
end 
  def current_user
    @current_user ||=User.find_by(id: session[:user_id]) if (session[:user_id].present?)
  end
  def user_signed_in?
    current_user.present?
  end
  def sign_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
  end
  def require_no_authentication
    return unless user_signed_in?
    flash[:warning] = 'You are signed in'
    redirect_to root_path 

  end
  def require_authentication
    return if user_signed_in?
    flash[:warning] = 'You are not signed in'
    redirect_to root_path 

  end
  def remember(user)
    user.remember_me
    cookies.encrypted.permanent[:remember_token] = user.remember_token
    cookies.encrypted.permanent[:user_id] = user.id
  end
  helper_method :current_user, :user_signed_in?
end