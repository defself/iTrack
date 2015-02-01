require 'rails_helper'

describe UsersController do
  let(:user) { create :user }

  describe "GET index" do
    before do
      create_list(:user, 3)
      get :index
    end

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :index }
    it { expect(assigns(:users)).to eq User.all }
  end

  describe "GET new" do
    before { get :new }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :new }
    it { expect(assigns(:user)).to be_instance_of User }
  end

  describe "POST create" do
    before { |example| post(:create, user: user_attrs) unless example.metadata[:skip_before] }

    context "doesn't create user" do
      let(:user_attrs) { attributes_for :user, email: "i_have_no_email" }

      it "successfully", skip_before: true do
        expect { post :create, user: user_attrs }.to_not change(User, :count)
      end
      it { is_expected.to respond_with :unprocessable_entity }
      it { is_expected.to render_template :new }
      it { expect(flash[:error]).to be_present }
      it { expect(assigns(:user)).to be_instance_of User }
    end

    context "creates user" do
      let(:user_attrs) { attributes_for :user, email: "i@have.email" }
      let(:last_user) { User.find_by(email: user_attrs[:email]) }

      it "successfully", skip_before: true do
        expect { post :create, user: user_attrs }.to change(User, :count).by 1
      end
      it { is_expected.to redirect_to user_path(last_user) }
      it { expect(flash[:notice]).to be_present }
      it { expect(assigns(:user)).to eq last_user }
    end
  end

  describe "GET show" do
    before { get :show, id: user.id }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :show }
    it { expect(assigns(:user)).to eq user }
  end

  describe "GET edit" do
    before { get :edit, id: user.id }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template :edit }
    it { expect(assigns(:user)).to eq user }
  end

  describe "PUT update" do
    before { put :update, id: user.id, user: user_attrs }

    context "doesn't update user" do
      let(:user_attrs) { attributes_for :user, email: "i_have_no_email" }

      it { is_expected.to respond_with :unprocessable_entity }
      it { is_expected.to render_template :edit }
      it { expect(flash[:error]).to be_present }
      it { expect(assigns(:user)).to eq user }
    end

    context "updates user" do
      let(:user_attrs) { attributes_for :user, email: "i@have.email" }

      it { is_expected.to redirect_to user_path(user) }
      it { expect(flash[:notice]).to be_present }
      it { expect(assigns(:user)).to eq user }
    end
  end

  describe "DELETE destroy" do
    it "disinfects from parasite unsuccessfully" do
      request.env["HTTP_REFERER"] = users_path
      expect { delete :destroy, id: "" }.to_not change(User, :count)
      is_expected.to redirect_to users_path
      expect(flash[:error]).to be_present
    end

    it "disinfects from parasite successfully" do
      user
      expect { delete :destroy, id: user.id }.to change(User, :count).by -1
      is_expected.to redirect_to users_path
      expect(flash[:notice]).to be_present
    end
  end

end
