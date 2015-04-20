require 'spec_helper'

describe Web::Account::Teams::MembersController do
  let(:team) { create :team, :with_user }
  let(:user) { team.users.first }
  before { sign_in user }

  describe 'GET #new' do
    subject { get :new }

    it { is_expected.to be_success }
  end

  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to be_success }
  end

  describe 'POST #create' do
    before { post :create, add_member_type: params }

    context 'new member' do
      let(:new_member) { create :user }
      let(:params) { { email: new_member.email } }

      it { expect(team.users).to include new_member }
      it { expect(team.users.count).to eq 2 }
    end

    context 'existing member' do
      let(:params) { { email: user.email } }

      it { expect(team.users.count).to eq 1 }
    end

    context 'unexisting member' do
      let(:params) { { email: generate(:email) } }

      it { expect(response).to be_success }
    end
  end
end
