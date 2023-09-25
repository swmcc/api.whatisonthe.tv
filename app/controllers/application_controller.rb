class ApplicationController < ActionController::API
  #before_action :authenticate_user!

  private

  def authenticate_user!
    token = request.headers['Authorization'].split(' ').last
    return unless token
    
    current_user = User.decode_jwt(token)
    head :unauthorized unless current_user
  end
end
