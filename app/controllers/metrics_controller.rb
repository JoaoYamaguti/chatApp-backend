class MetricsController < ApplicationController

    def show
        metrics = {
            users: {
                total: User.all.length
            },
            messages: {
                total: Message.all.length
            }
        }
        render json: metrics
    end
end
