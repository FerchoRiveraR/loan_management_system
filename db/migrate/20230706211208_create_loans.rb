class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :lender, null: false, foreign_key: true
      t.references :borrower, null: false, foreign_key: true
      t.references :loan_type, null: false, foreign_key: true
      t.integer :status
      t.date :approved_at

      t.timestamps
    end
  end
end
