module Response

  def satellite_json_response(object, status = :ok)
    render json: SatelliteSerializer.new(object), status: status
  end

end