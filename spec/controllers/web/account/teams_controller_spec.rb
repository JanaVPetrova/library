require 'spec_helper'

describe Web::Account::TeamsController do
  let(:user) { create :user }
  let(:team) { create :team }
  before do
    team.users << user
    sign_in user
  end

  describe 'GET #show' do
    subject { get :show }

    it { is_expected.to be_success }
  end

  describe 'GET #edit' do
    subject { get :edit }

    it { is_expected.to be_success }
  end

  describe 'PUT #update' do
    let(:params) { attributes_for :team }
    before do
      put :update, team: params
      team.reload
    end

    it { expect(response).to redirect_to account_team_path(team) }
    it { expect(team.title).to eq params[:title] }
  end

  describe 'DELETE #destroy' do
    before do
      delete :destroy
      team.reload
    end

    it { expect(response).to be_redirect }
    it { expect(team).to be_deleted }
  end
end
