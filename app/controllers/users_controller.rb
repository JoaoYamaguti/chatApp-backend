class UsersController < ApplicationController
  before_action :authenticate_request, only: [:update, :destroy]

  # GET /users/1
  def show
    userExists = User.find_by(id: params[:id])

    if !userExists
      render json: {error: "Usuário não encontrado."}, status: :not_found
      
      return
    end

    render json: {
      id: userExists.id,
      name: userExists.name,
      email: userExists.email
    }
  end

  # POST /users
  def create
    userExists = User.find_by(email: params[:email])
    
    if userExists
      render status: :bad_request, json: {error: "email already exists."}
      return
    end

    @user = User.create(name: params[:name], email: params[:email], password: params[:password])

    render json: {message: "User created."}
  end

  # PATCH/PUT /users/edit + token
  def update
    if params[:name]
      @current_user.update(name: params[:name])
    end

    if params[:password]
      @current_user.update(password: params[:password])
    end

    render json: {
      id: @current_user.id,
      name: @current_user.name,
      email: @current_user.email
    }
  end

  # DELETE /users/detele
  def destroy
    if @current_user.destroy!
      render json: {message: "User Deleted."}
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :id, :name, :email, :password ])
    end
end
