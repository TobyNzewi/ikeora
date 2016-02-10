require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  before do
    @valid_attributes = FactoryGirl.attributes_for(:profile)
    @invalid_attributes = FactoryGirl.attributes_for(:profile, first_name: nil, last_name: nil, phone_number: nil)
    @valid_attributes[:user_id] = @valid_attributes[:user][:id]
    @profile = FactoryGirl.create(:profile)
  end

  describe "Not Signed-In User" do
    it "should get redirected with a redirection status" do
      [:index, :new].each do |action|
        get action
        expect(response.status).to be 302
      end
      get :edit, id: @profile.id
      expect(response.status).to be 302
      put :update, id: @profile.id
      expect(response.status).to be 302
      post :create
      expect(response.status).to be 302
    end
  end

  describe "User Signed In" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "GET #index" do``
      before do
        get :index
      end
      it "assigns all profiles as @profiles" do
        expect(assigns(:profiles)).to eq([@profile])
      end
      it "should have a http success status" do
        expect(response).to have_http_status :success
      end
    end

    describe "GET #show" do
      before do
        get :show, id: @profile.to_param
      end
      it "assigns the requested profile as @profile" do
        expect(assigns(:profile)).to eq(@profile)
      end
      it "should have a http success status" do
        expect(response).to have_http_status :success
      end
    end

    describe "GET #new" do
      before do
        get :new
      end
      it "assigns a new profile as @profile" do
        expect(assigns(:profile)).to be_a_new(Profile)
      end
      it "should have a http success status" do
        expect(response).to have_http_status :success
      end
    end

    describe "GET #edit" do
      before do
        get :edit, id: @profile.to_param
      end
      it "assigns the requested profile as @profile" do
        expect(assigns(:profile)).to eq(@profile)
      end
      it "should have a http success status" do
        expect(response).to have_http_status :success
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Profile" do
          expect {
            post :create, profile: @valid_attributes
          }.to change(Profile, :count).by(1)
        end

        it "assigns a newly created profile as @profile" do
          post :create, profile: @valid_attributes
          expect(assigns(:profile)).to be_a(Profile)
          expect(assigns(:profile)).to be_persisted
        end

        it "redirects to the created profile" do
          post :create, profile: @valid_attributes
          expect(response).to redirect_to(Profile.last)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved profile as @profile" do
          post :create, profile: @invalid_attributes
          expect(assigns(:profile)).to be_a_new(Profile)
        end

        it "re-renders the 'new' template" do
          post :create, profile: @invalid_attributes
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        before do
          @new_attributes = FactoryGirl.attributes_for(:profile)
        end

        it "updates the requested profile" do
          profile = Profile.create! @valid_attributes
          put :update, id: @profile.to_param, profile: @new_attributes
          profile.reload
          expect(profile.first_name).to eq @valid_attributes[:first_name]
        end

        it "assigns the requested profile as @profile" do
          profile = Profile.create! @valid_attributes
          put :update, {:id => profile.to_param, :profile => @valid_attributes}
          expect(assigns(:profile)).to eq(profile)
        end

        it "redirects to the profile" do
          profile = Profile.create! @valid_attributes
          put :update, {:id => profile.to_param, :profile => @valid_attributes}
          expect(response).to redirect_to(profile)
        end
      end

      context "with invalid params" do
        it "assigns the profile as @profile" do
          profile = Profile.create! @valid_attributes
          put :update, {:id => profile.to_param, :profile => @invalid_attributes}
          expect(assigns(:profile)).to eq(profile)
        end

        it "re-renders the 'edit' template" do
          profile = Profile.create! @valid_attributes
          put :update, {:id => profile.to_param, :profile => @invalid_attributes}
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested profile" do
        profile = Profile.create! @valid_attributes
        expect {
          delete :destroy, id: profile.to_param
        }.to change(Profile, :count).by(-1)
      end

      it "redirects to the profiles list" do
        profile = Profile.create! @valid_attributes
        delete :destroy, id: profile.to_param
        expect(response).to redirect_to(profiles_url)
      end
    end
  end


end
