class MetricsController < ApplicationController

    def show
        metrics = {
            messages: {
                total: Message.all
            }
        }
        render json: metrics
    end
end
