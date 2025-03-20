class ChatController < ApplicationController
    before_action :authenticate_request, only: [:index, :show]

    #GET chat
    def index
        chats = []

        chats = Message.joins("INNER JOIN users ON (users.id = CASE 
        WHEN user_sender_id = #{@current_user.id} THEN user_receiver_id 
        ELSE user_sender_id END)")
        .where("user_sender_id = ? OR user_receiver_id = ?", @current_user.id, @current_user.id)
        .select("users.id, users.name, users.email")
        .distinct

        render json: {
            chats: chats
        }
    end

    #GET chat/:id
    def show
        id = params.expect(:id)
        render json: {
            receiver_user: User.find(id),
            messages: Message.where(user_sender_id: @current_user.id).where(user_receiver_id: id).or(Message.where(user_sender_id: id).where(user_receiver_id: @current_user.id)).order(created_at: :asc)
        }
    end

end
