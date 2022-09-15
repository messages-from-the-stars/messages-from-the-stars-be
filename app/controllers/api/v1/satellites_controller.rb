class Api::V1::SatellitesController < ApplicationController
  before_action :set_satellite, only: [:show]

  def show
    satellite_json_response(@satellite)
  end

  private

  def set_satellite
    @satellite = Satellite.find(params[:id])
  end

end