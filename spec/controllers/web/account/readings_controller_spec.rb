require 'spec_helper'

describe Web::Account::ReadingsController do
  describe "GET #index" do
    let(:user) { create :user }
    before { sign_in user }
    subject { get :index }

    it { is_expected.to have_http_status(:success) }
  end
end
