# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssignedBook, type: :model do
  describe 'created assigned book' do
    let(:book) { create(:book) }
    let(:book2) { create(:book, available: false) }
    let(:user) { create(:user) }
    let(:assigned_book) { create(:assigned_book, book_id: book.id, borrower_id: user.id) }
    context 'assigns a book successfully with the right credentials' do
      it 'returns book id' do
        expect(assigned_book.id).not_to be_nil
      end
    end

    context 'does not assign a book when all conditions are not fulfilled' do
      let(:assigned_book2) { build(:assigned_book, book_id: book2.id, borrower_id: user.id) }
      let(:assigned_book3) { build(:assigned_book, book_id: nil, borrower_id: nil, return_date: nil) }
      it 'does not save the book if book is unavailable' do
        expect(assigned_book2).to_not be_valid
      end

      it 'does not save if all necessary values are not present' do
        expect(assigned_book3).to_not be_valid
        errors = assigned_book3.errors.full_messages
        expect(errors).to include('Borrower must exist')
        expect(errors).to include("Return date can't be blank")
        expect(errors).to include('Book must exist')
      end
    end
  end
end
