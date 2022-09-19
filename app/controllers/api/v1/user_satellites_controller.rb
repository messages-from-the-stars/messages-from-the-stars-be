class Api::V1::UserSatellitesController < ApplicationController

  def create
    if params[:user_id].present? && params[:norad_id].present?
      satellite = Satellite.find_or_create_by(norad_id: params[:norad_id])
      
      UserSatellite.find_or_create_by(user_id: params[:user_id],satellite_id: satellite.id)\

      render json: satellite.id, status: 201
    else
      render status: 400
    end
  end

end