require "rails_helper"

RSpec.describe RelationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/relations").to route_to("relations#index")
    end

    it "routes to #new" do
      expect(get: "/relations/new").to route_to("relations#new")
    end

    it "routes to #show" do
      expect(get: "/relations/1").to route_to("relations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/relations/1/edit").to route_to("relations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/relations").to route_to("relations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/relations/1").to route_to("relations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/relations/1").to route_to("relations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/relations/1").to route_to("relations#destroy", id: "1")
    end
  end
end
