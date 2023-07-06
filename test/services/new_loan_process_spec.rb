require 'test_helper'

class NewLoanProcessTest < ActionDispatch::IntegrationTest
  setup do
    @lender = Lender.create!
    @borrower = Borrower.create!(email: "example#{Time.now.to_i}@loan.com")
    @loan_type = LoanType.create!(name: "Loan Type #{Time.now.to_i}")

    3.times do |n|
      @loan_type.documents.create(title: "Document #{n}")
    end
  end

  test 'create new loan' do
    assert_difference 'Loan.count' do
      NewLoanProcess.new(@lender, @borrower, @loan_type).call
    end
  end

  test 'validate associations' do
    loan = NewLoanProcess.new(@lender, @borrower, @loan_type).call

    assert_equal @lender, loan.lender
    assert_equal @borrower, loan.borrower
    assert_equal @loan_type, loan.loan_type
  end

  test 'create loan documents' do
    loan = nil
    assert_difference 'LoanDocument.count', @loan_type.documents.count do
      loan = NewLoanProcess.new(@lender, @borrower, @loan_type).call
    end

    loan.loan_documents.each do |loan_document|
      assert_includes @loan_type.documents, loan_document.document
    end

    assert_equal @loan_type.documents.count, loan.loan_documents.count
  end

  test 'send email to borrower' do
    assert_emails 1 do
      NewLoanProcess.new(@lender, @borrower, @loan_type).call
    end
  end
end
