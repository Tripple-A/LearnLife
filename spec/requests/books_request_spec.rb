# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'GET #index' do
    it 'does not render a different template' do
      get '/books'
      expect(response.body).to include('Hello, there are no books here yet')
    end

    describe 'after book creation, it renders all books' do
      it 'shows books on book creation' do
        Book.create(name: 'Amazing', description: 'My amazing book')
        Book.create(name: 'Ruby on Rails', description: 'My Ruby book')
        get '/books'
        expect(response.body).to include('My amazing book')
        expect(response.body).to include('My Ruby book')
      end
    end
  end

  describe 'GET #edit' do
    let(:book) { create(:book) }
    before { get edit_book_path(book) }
    it 'does not render a different template' do
      expect(response.body).to include('Update Book')
      expect(response.body).to include(book.description)
    end

    context 'updating book details' do
      before do
        put book_path(book, book: {
                        name: 'Go or Ruby',
                        description: 'Same as before'
                      })
      end

      it 'should update the name of the book' do
        expect(response).to redirect_to(book)
        book.reload
        expect(book.name).to eq 'Go or Ruby'
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:book) { create(:book) }
    before { delete book_path(book) }
    it 'should delete the book' do
      expect(response).to redirect_to(books_path)
      expect { Book.find(book.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'GET #show' do
    let(:book) { create(:book) }
    before { get book_path(book) }
    it 'should show the user' do
      expect(response.body).to include(book.name)
      expect(response.body).to include('Name:')
      expect(response.body).to include('Description')
      expect(response.body).to include(book.description)
    end
  end

  describe 'POST #create' do
    before do
      post books_path(book: {
          name: 'Javascript',
          description: 'A book on Javascript'
        })
    end
    it 'should create a new book' do
      expect(Book.last.name).to eq('Javascript')
      expect(response.body).to redirect_to(Book.last)
    end
  end
end
