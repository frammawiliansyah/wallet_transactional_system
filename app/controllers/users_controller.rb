class UsersController < ApplicationController
  def index
    users = User.select(:id, :full_name, :email_address).order(:full_name)

    render json: users, status: 200
  end
end