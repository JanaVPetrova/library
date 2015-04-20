require 'spec_helper'

describe Web::SessionsController do
  let(:password) { generate :string }
  let(:user) { create :user, password: password, password_confirmation: password }

  describe 'GET #new' do
    render_views
    subject { get :new }

    it { is_expected.to be_success }
  end

  describe 'POST #create' do
    let(:params) { { email: user.email, password: password } }
    before { post :create, user_sign_in_type: params }

    it { expect(response).to redirect_to root_path }
    it { expect(current_user).to eq user }
  end

  describe 'DELETE #destroy' do
    before do
      sign_in user

      delete :destroy
    end

    it { expect(response).to be_redirect }
    it { expect(current_user).to be nil }
  end
end
