# frozen_string_literal: true

FactoryBot.define do
  factory :assigned_book do
    book_id { '1' }
    borrower_id { '1' }
    return_date { '2021-07-24' }
  end
end
