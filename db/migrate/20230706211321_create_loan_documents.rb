class CreateLoanDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :loan_documents do |t|
      t.references :loan, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.boolean :approved

      t.timestamps
    end
  end
end
