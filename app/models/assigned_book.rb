# frozen_string_literal: true

class AssignedBook < ApplicationRecord
  belongs_to :borrower, class_name: 'User'
  belongs_to :book
  validates_presence_of :return_date
  validate :book_must_be_available

  def book_must_be_available
    available = Book.find(book_id).available if book_id
    errors.add(:book_id, 'is unavailable') unless available
  end
end
