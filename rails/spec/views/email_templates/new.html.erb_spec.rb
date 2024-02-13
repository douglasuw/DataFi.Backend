require 'rails_helper'

RSpec.describe "email_templates/new", type: :view do
  before(:each) do
    assign(:email_template, EmailTemplate.new(
      title: "MyString",
      content: "MyText"
    ))
  end

  it "renders new email_template form" do
    render

    assert_select "form[action=?][method=?]", email_templates_path, "post" do

      assert_select "input[name=?]", "email_template[title]"

      assert_select "textarea[name=?]", "email_template[content]"
    end
  end
end
