class Api::V1::UserSatellitesController < ApplicationController

  def create
    if params[:user_id].present? && params[:sat_id].present?      
      user_sat = UserSatellite.find_or_create_by(user_id: params[:user_id],satellite_id: params[:sat_id])
       
      render status: 201
    else
      render status: 400
    end
  end

end