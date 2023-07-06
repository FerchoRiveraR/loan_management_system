# rubocop:disable Style/HashSyntax

class NewLoanProcess
  attr_accessor :lender, :borrower, :loan_type

  def initialize(lender, borrower, loan_type)
    @lender = lender
    @borrower = borrower
    @loan_type = loan_type
  end

  def call
    loan = Loan.create(lender: @lender,
                       borrower: @borrower,
                       loan_type: @loan_type)
    loan_type.documents.each do |document|
      LoanDocument.create(loan: loan,
                          document: document)
    end

    LoanMailer.new_loan(loan).deliver

    loan
  end
end

# rubocop:enable Style/HashSyntax
