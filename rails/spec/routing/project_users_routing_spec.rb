require "rails_helper"

RSpec.describe ProjectUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project_users").to route_to("project_users#index")
    end

    it "routes to #new" do
      expect(get: "/project_users/new").to route_to("project_users#new")
    end

    it "routes to #show" do
      expect(get: "/project_users/1").to route_to("project_users#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/project_users/1/edit").to route_to("project_users#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project_users").to route_to("project_users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project_users/1").to route_to("project_users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project_users/1").to route_to("project_users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project_users/1").to route_to("project_users#destroy", id: "1")
    end
  end
end
