class Loan < ApplicationRecord
  belongs_to :lender
  belongs_to :borrower
  belongs_to :loan_type

  has_many :loan_documents

  enum status: %i[approved rejected]
end
