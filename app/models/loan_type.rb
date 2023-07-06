class LoanType < ApplicationRecord
  has_and_belongs_to_many :documents

  validates :name, presence: true
end
