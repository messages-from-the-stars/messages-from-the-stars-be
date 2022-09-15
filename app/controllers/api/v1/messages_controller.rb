class Api::V1::MessagesController < ApplicationController

  def find_by_sat_id
    @messages = Message.find_by_sat_id(params[:sat_id])

    message_json_response(@messages)
  end

end