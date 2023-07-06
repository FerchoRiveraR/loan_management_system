class Borrower < ApplicationRecord
  validates :email, presence: true, email: true

  has_many :loans
end
