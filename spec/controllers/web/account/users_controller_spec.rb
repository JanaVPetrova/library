require 'spec_helper'

describe Web::Account::UsersController do
  let(:user) { create :user }
  before { sign_in user }

  describe 'GET #show' do
    subject { get :show }

    it { is_expected.to be_success }
  end
end
