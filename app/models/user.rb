# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  has_many :assigned_books, foreign_key: :borrower_id
  has_many :borrowed_books, through: :assigned_books, source: :book

  def full_name
    "#{first_name} #{last_name}".upcase
  end
end
