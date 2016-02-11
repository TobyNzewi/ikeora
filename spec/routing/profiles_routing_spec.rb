require "rails_helper"

RSpec.describe ProfilesController, type: :routing do
  describe "routing" do

    it "does not route to #index" do
      expect(:get => "/profiles").not_to be_routable
    end

    it "does not route to #new" do
      expect(:get => "/profiles/new").not_to be_routable
    end

    it "routes to #show" do
      expect(:get => "/profile/show").to route_to("profiles#show")
    end

    it "routes to #edit" do
      expect(:get => "/profile/edit").to route_to("profiles#edit")
    end

    it "does not route to #create" do
      expect(:post => "/profiles").not_to be_routable
    end

    it "routes to #update via PUT" do
      expect(:put => "/profile/update").to route_to("profiles#update")
    end

    it "does not route to #destroy" do
      expect(:delete => "/profile/destroy").not_to be_routable
    end

  end
end
