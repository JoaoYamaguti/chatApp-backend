class ChatController < ApplicationController
    before_action :authenticate_request, only: [:index, :show]

    #GET chat
    def index
        chats = []

        # allMessages = Message.where(user_sender_id: @current_user.id).or(Message.where(user_receiver_id: @current_user.id)).order(created_at: :asc).group(:user_sender_id).group(:user_receiver_id)

        allMessages = Message.select('DISTINCT messages.user_receiver_id, users.name, users.email')
        .joins(:user)  # Faz o join com a tabela de users
        .where(user_sender_id: 1)  # Filtra pelo user_sender_id
        .map { |message| [message.user_receiver_id, message.name, message.email] }

        chats = allMessages

        # allMessages.each do |message|
        #     if @current_user.id == message.user_sender_id
        #         unless chats.include?(User.find(message.user_receiver_id))
        #             chats.push(User.find(message.user_receiver_id))
        #         end
        #     else
        #         unless chats.include?(User.find(message.user_sender_id))
        #             chats.push(User.find(message.user_sender_id))
        #         end
        #     end
        # end

        render json: {
            chats: chats
        }
    end

    #GET chat/:id
    def show
        id = params.extract_value(:id)
        render json: {
            receiver_user: User.find(id),
            messages: Message.where(user_sender_id: @current_user.id).where(user_receiver_id: id).or(Message.where(user_sender_id: id).where(user_receiver_id: @current_user.id)).order(created_at: :asc)
        }
    end

end
