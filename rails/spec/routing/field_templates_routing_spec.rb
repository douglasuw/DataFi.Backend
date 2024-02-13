require "rails_helper"

RSpec.describe FieldTemplatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/field_templates").to route_to("field_templates#index")
    end

    it "routes to #new" do
      expect(get: "/field_templates/new").to route_to("field_templates#new")
    end

    it "routes to #show" do
      expect(get: "/field_templates/1").to route_to("field_templates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/field_templates/1/edit").to route_to("field_templates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/field_templates").to route_to("field_templates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/field_templates/1").to route_to("field_templates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/field_templates/1").to route_to("field_templates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/field_templates/1").to route_to("field_templates#destroy", id: "1")
    end
  end
end
