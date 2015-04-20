require 'spec_helper'

describe Web::UsersController do
  describe 'GET #new' do
    render_views
    subject { get :new }

    it { is_expected.to be_success }
  end

  describe 'POST #create' do
    let(:params) { attributes_for :user }
    before { post :create, user: params }

    it { expect(response).to redirect_to root_path }
    it { expect(User.where(email: params[:email])).to exist }
  end
end
