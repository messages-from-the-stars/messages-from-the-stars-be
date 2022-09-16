class Api::V1::UsersController < ApplicationController

  def find_or_create_user
    if params[:name].present? && params[:username].present?
      if User.find_by(username: params[:username]) != nil
        render status: 200
      else
        User.create(username: params[:username], name: params[:name])
        render status: 200
      end
    else
      render status: 400
    end
  end

end