module ApplicationHelper


  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if cookies[:remember_token]
      current_user  ||= User.find_by(:remember_token, cookies[:remember_token])
    else
      return nil
    end
  end

  def curren_user=(user)
    sign_in(user)
  end

  def logged_in?
    !cookies[:remember_token].blank?
  end

  def sign_out
    cookies[:remember_token] = nil
  end

end
