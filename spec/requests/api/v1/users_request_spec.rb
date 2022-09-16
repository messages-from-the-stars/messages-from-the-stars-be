require 'rails_helper'

describe 'users API' do

  it 'can find a user if they are already registered' do
    user_1 = FactoryBot.create(:user)

    expect(User.count).to eq(1)

    get "/api/v1/users/find_or_create_user?username=#{user_1.username}&name=#{user_1.name}"

    expect(response).to be_successful

    expect(User.count).to eq(1)

  end

  it 'creates a new user if not already registered' do
    expect(User.count).to eq(0)

    username = "JimmySnakes@snake.net"
    name = "Snake Jones"

    get "/api/v1/users/find_or_create_user?username=#{username}&name=#{name}"

    expect(response).to be_successful

    expect(User.count).to eq(1)
  end

  it 'returns an unsuccessful response if name not included in call' do

    username = "JimmySnakes@snake.net"

    get "/api/v1/users/find_or_create_user?username=#{username}"

    expect(response).to_not be_successful

    expect(User.count).to eq(0)

  end

  it 'returns an unsuccessful response if username not included in call' do

    name = "Snake Jones"

    get "/api/v1/users/find_or_create_user?name=#{name}"

    expect(response).to_not be_successful

    expect(User.count).to eq(0)

  end

end