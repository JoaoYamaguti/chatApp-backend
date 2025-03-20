class MessagesController < ApplicationController
  before_action :authenticate_request, only: [:create]

  # GET /messages/show
  def show 
    id = 2
    render json: {
      message: Message.find(id),
      user_sender: Message.find(id).user_sender,
      user_receiver: Message.find(id).user_receiver
    }
  end

  # POST /messages/create
  def create
    userExists = User.find_by(id: params[:user_receiver_id])
    if !userExists
      render json: {error: "receiver user does not exists."} , status: :unprocessable_entity
      return
    end

    @message = Message.create(user_sender_id: @current_user.id, user_receiver_id: params[:user_receiver_id], content: params[:content])

    render json: {message: "Message sent."}
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
