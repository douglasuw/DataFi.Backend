require "rails_helper"

RSpec.describe PlanTeamsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/plan_teams").to route_to("plan_teams#index")
    end

    it "routes to #new" do
      expect(get: "/plan_teams/new").to route_to("plan_teams#new")
    end

    it "routes to #show" do
      expect(get: "/plan_teams/1").to route_to("plan_teams#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/plan_teams/1/edit").to route_to("plan_teams#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/plan_teams").to route_to("plan_teams#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/plan_teams/1").to route_to("plan_teams#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/plan_teams/1").to route_to("plan_teams#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/plan_teams/1").to route_to("plan_teams#destroy", id: "1")
    end
  end
end
