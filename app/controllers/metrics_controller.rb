class MetricsController < ApplicationController

    def show
        metrics = {
            users: {
                total: User.all.count
            },
            messages: {
                total: Message.all.count,
                sender: Message.where(user_sender_id: 1).count
            },
        }
        render json: metrics
    end
end
