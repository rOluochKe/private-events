# frozen_string_literal: true

module SessionsHelper
  # Logs in the given user.
  def sign_in(user)
    session[:user_id] = user.id
    current_user
  end

  def remember(user)
    user.generate_token
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    user.update_token
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user &.authenticated?(cookies[:remember_token])
        sign_in user
        current_user = user
      end
    end
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    current_user && current_user == user
  end

  # Logs out the current user.
  def sign_out
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session.delete(:user_id)
    current_user = nil
  end

  # Check log in status
  def logged_in?
    !current_user.nil?
  end

  # Redirects to stored location (or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
