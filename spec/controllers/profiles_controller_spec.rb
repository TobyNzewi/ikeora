require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
    @profile = @user.profile
  end

  describe "Not Signed-In User" do
    it "should get redirected with a redirection status" do
      get :edit
      expect(response.status).to be 302
      put :update
      expect(response.status).to be 302
    end
  end

  describe "User Signed In" do
    before do
      sign_in @user
    end

    describe "GET #show" do
      before do
        get :show
      end
      it "assigns the requested profile as @profile" do
        expect(assigns(:profile)).to eq(@profile)
      end
      it "should have a http success status" do
        expect(response).to have_http_status :success
      end
    end

    describe "GET #edit" do
      before do
        get :edit
      end
      it "assigns the current user's profile as @profile" do
        expect(assigns(:profile)).to eq(@profile)
      end
      it "should have a http success status" do
        expect(response).to have_http_status :success
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        before do
          @new_attributes = FactoryGirl.attributes_for(:profile)
          put :update, profile: @new_attributes
          @profile.reload
        end

        it "assigns user's profile as @profile" do
          expect(assigns(:profile)).to eq @profile
        end

        it "updates the requested profile" do
          expect(@profile.first_name).to eq @new_attributes[:first_name]
        end

        it "redirects to the profile" do
          expect(response).to redirect_to(profile_show_path)
        end
      end

      context "with invalid params" do
        before do
          @invalid_attributes = FactoryGirl.attributes_for(:profile, first_name: nil, last_name: nil, phone_number: nil)
          put :update, profile: @invalid_attributes
        end
        it "assigns the profile as @profile" do
          expect(assigns(:profile)).to eq(@profile)
        end

        it "re-renders the 'edit' template" do
          expect(response).to render_template("edit")
        end
      end
    end
  end
end
