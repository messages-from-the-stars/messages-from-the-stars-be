class Api::V1::UsersController < ApplicationController

  def find_or_create_user
    if params[:name].present? && params[:username].present?
      if User.find_by(username: params[:username]) != nil
        user_json_response(User.find_by(username: params[:username]))
      else
        user_json_response(User.create(username: params[:username], name: params[:name]))
      end
    else
      render status: 400
    end
  end

end