# frozen_string_literal: true

class Book < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  has_many :assigned_books, dependent: :destroy
  scope :available, -> { where(available: true) }
end
