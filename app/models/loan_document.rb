class LoanDocument < ApplicationRecord
  belongs_to :loan
  belongs_to :document
end
