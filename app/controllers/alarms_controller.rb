class AlarmsController < ApplicationController
    def index
        render json: Alarm.all.order(created_at: :desc)
    end

    def show
        render json: Alarm.find(params[:id])
    end

    def create
        render json: Alarm.create!(alarm_params), status: :created
    end

    def update
        alarm = Alarm.find(params[:id])
        alarm.update!(alarm_params)
        render json: alarm
    end

    def destroy
        Alarm.find(params[:id]).destroy
        head :no_content
    end

    private

    def alarm_params
        params.permit(:user_id, :alarm_name, :alarm_start, :alarm_end, :alarm_increment, :is_disabled)
    end
end
