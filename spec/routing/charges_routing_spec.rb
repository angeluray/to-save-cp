require "rails_helper"

RSpec.describe ChargesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/charges").to route_to("charges#index")
    end

    it "routes to #new" do
      expect(get: "/charges/new").to route_to("charges#new")
    end

    it "routes to #show" do
      expect(get: "/charges/1").to route_to("charges#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/charges/1/edit").to route_to("charges#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/charges").to route_to("charges#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/charges/1").to route_to("charges#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/charges/1").to route_to("charges#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/charges/1").to route_to("charges#destroy", id: "1")
    end
  end
end
