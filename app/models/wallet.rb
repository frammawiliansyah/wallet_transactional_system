class Wallet < ApplicationRecord
  has_one :users
  has_one :teams
end
