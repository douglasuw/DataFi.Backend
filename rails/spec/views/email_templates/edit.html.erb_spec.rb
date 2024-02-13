require 'rails_helper'

RSpec.describe "email_templates/edit", type: :view do
  let(:email_template) {
    EmailTemplate.create!(
      title: "MyString",
      content: "MyText"
    )
  }

  before(:each) do
    assign(:email_template, email_template)
  end

  it "renders the edit email_template form" do
    render

    assert_select "form[action=?][method=?]", email_template_path(email_template), "post" do

      assert_select "input[name=?]", "email_template[title]"

      assert_select "textarea[name=?]", "email_template[content]"
    end
  end
end
