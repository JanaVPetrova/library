require 'spec_helper'

describe Web::TeamsController do
  let(:user) { create :user }
  let(:team) { create :team }
  before { sign_in user }

  describe 'GET #new' do
    subject { get :new }

    it { is_expected.to be_success }
  end

  describe 'POST #create' do
    let(:params) { attributes_for :team }
    before { post :create, team: params }

    it { expect(response).to be_redirect }
    it { expect(Team.where(title: params[:title])).to exist }
    it { expect(Team.find_by(title: params[:title]).users).to include user }
  end

  describe 'GET #show' do
    subject { get :show, id: team.id }

    it { is_expected.to be_success }
  end
end
