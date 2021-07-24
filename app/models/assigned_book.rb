# frozen_string_literal: true

class AssignedBook < ApplicationRecord
  belongs_to :borrower, class_name: 'User'
  belongs_to :book
  validates_presence_of :return_date
  before_save :confirm_availability

  def confirm_availability
    book_id = self.book_id
    available = Book.find(book_id).available
    return if available

    errors.add(:book_id, 'this book is unavailable')
    throw :abort
  end
end
