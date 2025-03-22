class MetricsController < ApplicationController

    def show
        metrics = {
                users: {
                    total: User.all.count,
                    online: "undefined",
                    offline: "undefined",
                },
                messages: {
                    total: Message.all.count,
                },
            }
        render json: metrics
    end
end
