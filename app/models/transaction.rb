class Transaction < ApplicationRecord
  after_commit :calculate_balance

  def calculate_balance
    if self.target_wallet_id.present?
      target_wallet = Wallet.find(self.target_wallet_id)
      target_credit = Transaction.where(target_wallet_id: self.target_wallet_id).sum(:amount)
      target_debit = Transaction.where(source_wallet_id: self.target_wallet_id).sum(:amount)
      target_wallet.update(balance: target_credit - target_debit)
    end

    if self.source_wallet_id.present?
      source_wallet = Wallet.find(self.source_wallet_id)
      source_credit = Transaction.where(target_wallet_id: self.source_wallet_id).sum(:amount)
      source_debit = Transaction.where(source_wallet_id: self.source_wallet_id).sum(:amount)
      source_wallet.update(balance: source_credit - source_debit)
    end
  end
end

credit = Transaction.where(target_wallet_id: 10).sum(:amount)
debit = Transaction.where(source_wallet_id: 10).sum(:amount)