# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'created user' do
    context 'creates user successfully with the right credentials' do
      let(:user) { create(:user) }
      it 'returns user id' do
        expect(user.id).not_to be_nil
      end

      it "return user's full name" do
        expect(user.full_name).to eq 'HENRY FORD'
      end
    end

    context 'does not create user when validations fail' do
      let(:user) { build(:user, first_name: nil, last_name: nil) }
      it ' does not save the user' do
        expect(user).to_not be_valid
        errors = user.errors.full_messages
        expect(errors.count).to eq 2
        expect(errors).to include("First name can't be blank")
        expect(errors).to include("Last name can't be blank")
      end
    end
  end
end
