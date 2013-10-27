module SessionsHelper
  def sign_in(user)
    # create a new token
    remember_token = User.new_remember_token
    # place the unencrypted token in the browser cookies
    cookies.permanent[:remember_token] = remember_token
    # save the encrypted token to the database
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    # set the current_user = to user
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    current_user == user
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user?(user)
    user == current_user
  end

  def is_admin?
    current_user.admin?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
