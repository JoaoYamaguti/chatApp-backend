class AuthController < ApplicationController
  # POST /login
  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password]) # Verifica se a senha está correta
      token = JsonWebToken.encode(user_id: @user.id) # Gera o token JWT
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Credenciais inválidas' }, status: :unauthorized
    end
  end

end
