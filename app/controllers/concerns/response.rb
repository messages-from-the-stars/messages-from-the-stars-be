module Response

  def satellite_json_response(object, status = :ok)
    render json: SatelliteSerializer.new(object), status: status
  end

  def message_json_response(object, status = :ok)
    render json: MessageSerializer.new(object), status: status
  end

  def user_json_response(object, status = :ok)
    render json: UserSerializer.new(object), status: status
  end

end