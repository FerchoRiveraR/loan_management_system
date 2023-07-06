class LoansController < ApplicationController
  before_action :set_loan_type, only: [:create]

  def new
    @loan = Loan.new
  end

  def create
    borrower = Borrower.create!(loan_params)
    lender = Lender.create!

    NewLoanProcess.new(lender, borrower, @loan_type)

    head :ok
  end

  private

  def loan_params
    params.require(:loan).permit(:email)
  end

  def set_loan_type
    @loan_type = LoanType.find(params.dig(:loan, :loan_type_id))
  end
end
