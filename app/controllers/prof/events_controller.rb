module Prof  
    class EventsController < ApplicationController
        def create
            event = Event.new(event_params)
            if event.save
                render json: event
            else 
                render json: {error: 'event not insert'}
            end
        end

        def index
            events = Event.all
            render json: events
        end








        private
        def event_params
            params.require(:event).permit(:event_title, :date)
        end 
    end
end