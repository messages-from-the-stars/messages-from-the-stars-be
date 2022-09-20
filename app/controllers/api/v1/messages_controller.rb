class Api::V1::MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  def show
    message_json_response(@message)
  end

  def create
    message = Message.new(message_params)

    if message.save
      message_json_response(message)
    else
      render status: 400
    end
  end
  
  def find_by_sat_id
    @messages = Message.find_by_sat_id(params[:sat_id])

    message_json_response(@messages)
  end

  def find_by_norad_id
    satellite = Satellite.find_by(norad_id: params[:norad_id])
    
    info = [params[:norad_id], Message.find_by_sat_id(satellite.id).count]

    render json: info, status: 201
  end

  private

  def message_params
    params.require(:message).permit(:satellite_id, :start_lat, :start_lng, :content)
  end

  def set_message
    @message = Message.find(params[:id])
  end

end