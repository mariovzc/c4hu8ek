class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  def authenticate
    email = request.headers['X-User-Email']
    api_token = request.headers['X-Api-Token']
    @user = User.find_by(email: email, api_token: api_token)

    unless @user
      head status: :unauthorized
      return false
    end
  end
end
