class MessagesController < ApplicationController
  before_action :authenticate_request, only: [:create]

  # POST /messages/create
  def create
    userExists = User.find_by(id: params[:user_receiver_id])
    if !userExists
      render json: {message: "receiver user does not exists."} , status: :unprocessable_entity
      return
    end

    @message = Message.new(user_sender_id: @current_user.id, user_receiver_id: params[:user_receiver_id], content: params[:content])

    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.expect(message: [ :user_receiver_id, :content ])
    end
end
