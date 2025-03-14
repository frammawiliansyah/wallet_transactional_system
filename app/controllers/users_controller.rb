class UsersController < ApplicationController
  def index
    users = User.joins(:wallet).select("users.id, users.full_name, users.email_address, wallets.address AS wallet_address").order(:full_name)

    render json: users, status: 200
  end
end