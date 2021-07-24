# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'created book' do
    context 'creates book successfully with the right credentials' do
      let(:book) { create(:book) }
      it 'returns book id' do
        expect(book.id).not_to be_nil
      end
    end

    context 'does not create book when validations fail' do
      let(:book) { build(:book, name: nil, description: nil) }
      it 'does not save the book' do
        expect(book).to_not be_valid
        errors = book.errors.full_messages
        expect(errors.count).to eq 2
        expect(errors).to include("Name can't be blank")
        expect(errors).to include("Description can't be blank")
      end
    end
  end
end
