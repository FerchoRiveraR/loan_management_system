# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#

3.times do
  loan_type = LoanType.create!(name: "Loan Type #{Time.now.to_i}")
  loan_type.documents.create!(title: "Document #{Time.now.to_i}")
end
