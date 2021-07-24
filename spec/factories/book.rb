# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    name { 'Book 1' }
    description { 'My first book' }
    available { true }
  end
end
