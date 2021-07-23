class AssignedBook < ApplicationRecord
  belongs_to :borrower, class_name: 'User'
  belongs_to :book
end
