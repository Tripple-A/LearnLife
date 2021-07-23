class CreateAssignedBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :assigned_books do |t|
      t.integer :borrower_id
      t.integer :book_id
      t.date :return_date
      t.timestamps
    end
  end
end
