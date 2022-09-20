class Api::V1::SatellitesController < ApplicationController
  before_action :set_satellite, only: [:show]

  def show
    satellite_json_response(@satellite)
  end

  def create
    @satellite = Satellite.find_or_create_by(norad_id: params[:sat_id])

    satellite_json_response(@satellite)
  end

  def find_by_user_id
    user_sat_ids = UserSatellite.where(user_id: params[:user_id])
    
    sat_ids = user_sat_ids.map do |ids|
      ids[:satellite_id]
    end.uniq

    satellites = Satellite.find(sat_ids)

    satellite_json_response(satellites)
  end

  private

  def set_satellite
    @satellite = Satellite.find(params[:id])
  end

end