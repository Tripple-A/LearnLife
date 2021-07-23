# frozen_string_literal: true

class AssignedBook < ApplicationRecord
  belongs_to :borrower, class_name: 'User'
  belongs_to :book
  validates_presence_of :return_date
end
