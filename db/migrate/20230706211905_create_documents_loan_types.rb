class CreateDocumentsLoanTypes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :documents, :loan_types
  end
end
