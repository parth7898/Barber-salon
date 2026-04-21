class ApplicationController < ActionController::API

  def current_user
    token = request.headers['Authorization']&.split(' ')&.last
    return nil unless token

    decoded = JsonWebToken.decode(token)
    @current_user ||= User.find_by(id: decoded[:user_id]) if decoded
  end

  def authorize_request
    render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
  end
  def authorize_admin!
    return render json: { error: 'Admins only' }, status: :forbidden unless current_user&.admin?
  end
  
end