class ApplicationController < ActionController::API
    def authenticate_request
        header = request.headers['Authorization']
        token = header.split(' ').last if header
    
        begin
          decoded = JsonWebToken.decode(token)
          @current_user = User.find(decoded[:user_id])
        rescue JWT::DecodeError => e
          render json: { error: 'Token inválido ou expirado' }, status: :unauthorized
        end
      end
end
