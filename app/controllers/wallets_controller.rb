class WalletsController < ApplicationController
  def index
    wallets = Wallet.select(:id, :address, :balance).order(:balance)
    
    render json: wallets, status: 200
  end

  def show
    wallet = Wallet.find_by(address: params[:id])

    render json: wallet, status: 200
  end

  def topup
    amount = params[:amount].abs
    wallet = Wallet.find_by(address: params[:wallet_address])

    transaction_option = {
      code: "TP-#{wallet.id}-#{Time.current.strftime("%y%m%d-%H%M%S")}",
      target_wallet_id: wallet.id,
      amount: amount }
    transaction = Transaction.create(transaction_option)

    render json: transaction, status: 200
  end

  def withdrawal
    amount = params[:amount].abs
    wallet = Wallet.find_by(address: params[:wallet_address])

    transaction_option = {
      code: "WD-#{wallet.id}-#{Time.current.strftime("%y%m%d-%H%M%S")}",
      source_wallet_id: wallet.id,
      amount: amount }
    transaction = Transaction.create(transaction_option)

    render json: transaction, status: 200
  end
end
