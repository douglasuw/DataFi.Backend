require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/email_templates", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # EmailTemplate. As you add validations to EmailTemplate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      EmailTemplate.create! valid_attributes
      get email_templates_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      email_template = EmailTemplate.create! valid_attributes
      get email_template_url(email_template)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_email_template_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      email_template = EmailTemplate.create! valid_attributes
      get edit_email_template_url(email_template)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new EmailTemplate" do
        expect {
          post email_templates_url, params: { email_template: valid_attributes }
        }.to change(EmailTemplate, :count).by(1)
      end

      it "redirects to the created email_template" do
        post email_templates_url, params: { email_template: valid_attributes }
        expect(response).to redirect_to(email_template_url(EmailTemplate.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new EmailTemplate" do
        expect {
          post email_templates_url, params: { email_template: invalid_attributes }
        }.to change(EmailTemplate, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post email_templates_url, params: { email_template: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested email_template" do
        email_template = EmailTemplate.create! valid_attributes
        patch email_template_url(email_template), params: { email_template: new_attributes }
        email_template.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the email_template" do
        email_template = EmailTemplate.create! valid_attributes
        patch email_template_url(email_template), params: { email_template: new_attributes }
        email_template.reload
        expect(response).to redirect_to(email_template_url(email_template))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        email_template = EmailTemplate.create! valid_attributes
        patch email_template_url(email_template), params: { email_template: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested email_template" do
      email_template = EmailTemplate.create! valid_attributes
      expect {
        delete email_template_url(email_template)
      }.to change(EmailTemplate, :count).by(-1)
    end

    it "redirects to the email_templates list" do
      email_template = EmailTemplate.create! valid_attributes
      delete email_template_url(email_template)
      expect(response).to redirect_to(email_templates_url)
    end
  end
end