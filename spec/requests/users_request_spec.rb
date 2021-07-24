# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'does not render a different template' do
      get '/users'
      expect(response.body).to include('There are no users yet')
    end

    context 'after user creation, it renders all users' do
      it 'shows users on user creation' do
        User.create(last_name: 'Timothy', first_name: 'Ima')
        get '/users'
        expect(response.body).to include('Timothy')
      end
    end
  end

  describe 'GET #edit' do
    let(:user) { create(:user) }
    before { get edit_user_path(user) }
    it 'does not render a different template' do
      expect(response.body).to include('Update User')
      expect(response.body).to include(user.first_name)
    end

    context 'updating user details' do
      before do
        put user_path(user, user: {
                        first_name: 'Basket',
                        last_name: 'Ball'
                      })
      end
      it 'should update the name of the user' do
        expect(response).to redirect_to(user)
        user.reload
        expect(user.full_name).to eq 'BASKET BALL'
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    before { delete user_path(user) }
    it 'should delete the user' do
      expect(response).to redirect_to(users_path)
      expect { User.find(user.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    before { get user_path(user) }
    it 'should show the user' do
      expect(response.body).to include(user.full_name)
      expect(response.body).to include("Books borrowed by #{user.first_name}")
    end
  end

  describe 'POST #create' do
    before do
      post users_path(user: {
                        first_name: 'Hello',
                        last_name: 'There'
                      })
    end
    it 'should create a new user' do
      expect(User.last.full_name).to eq('HELLO THERE')
      expect(response.body).to redirect_to(User.last)
    end
  end

  describe 'POST #assign' do
    let(:user) { create(:user) }
    let(:book) { create(:book) }
    before { post user_assign_book_path(user, assigned_book: { book_id: book.id, return_date: '2021-05-09' }) }
    it 'should assign a book to a user' do
      expect(user.borrowed_books).to eq([book])
      expect(AssignedBook.last.borrower).to eq(user)
    end

    it 'should get all borrowed books' do
      get '/borrowed_books'
      expect(response.body).to include(book.name)
      expect(response.body).to include(user.full_name)
    end
  end
end
