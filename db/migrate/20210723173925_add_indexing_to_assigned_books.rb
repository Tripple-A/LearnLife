class AddIndexingToAssignedBooks < ActiveRecord::Migration[6.1]
  def change
    add_index :assigned_books, [:borrower_id, :book_id], unique: true
  end
end
