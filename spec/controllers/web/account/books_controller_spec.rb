require 'spec_helper'

describe Web::Account::BooksController do
  let(:user) { create :user }
  let(:book) { create :book, user: user }
  before { sign_in user }

  describe 'GET #new' do
    subject { get :new }

    it { is_expected.to be_success }
  end

  describe 'POST #create' do
    let(:params) { attributes_for :book }
    before { post :create, book: params }

    it { expect(response).to redirect_to account_books_path }
    it { expect(Book.where(title: params[:title])).to exist }
    it { expect(Book.find_by(title: params[:title]).user).to eq user }
  end

  describe 'GET #show' do
    subject { get :show, id: book.id }

    it { is_expected.to be_success }
  end

  describe 'GET #edit' do
    subject { get :edit, id: book.id }

    it { is_expected.to be_success }
  end

  describe 'PUT #update' do
    let(:params) { attributes_for :book }
    before do
      put :update, id: book.id, book: params
      book.reload
    end

    it { expect(response).to redirect_to account_book_path(book) }
    it { expect(book.title).to eq params[:title] }
  end

  describe 'DELETE #destroy' do
    before do
      delete :destroy, id: book.id
      book.reload
    end

    it { expect(response).to be_redirect }
    it { expect(book).to be_deleted }
  end
end
