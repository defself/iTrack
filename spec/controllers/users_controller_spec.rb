require 'rails_helper'

describe UsersController do

  describe "GET index" do
    before do
      create_list(:user, 3)
      get :index
    end

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :index }
    it { expect(assigns(:users)).to eq User.all }
  end

  describe "GET show" do
    let(:user) { create :user }
    before { get :show, id: user.id }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :show }
    it { expect(assigns(:user)).to eq user }
  end

end
