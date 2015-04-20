require 'spec_helper'

describe Web::BooksController do
  render_views
  let(:book) { create :book }

  describe 'GET #show' do
    subject { get :show, id: book.id }

    it { is_expected.to be_success }
  end

  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to be_success }
  end
end
