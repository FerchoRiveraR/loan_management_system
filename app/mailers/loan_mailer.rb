class LoanMailer < ApplicationMailer
  def new_loan(loan)
    email = loan.borrower.email
    mail(to: email, subject: 'New loan process')
  end
end
