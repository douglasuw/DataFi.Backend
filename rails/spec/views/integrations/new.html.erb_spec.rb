require 'rails_helper'

RSpec.describe "integrations/new", type: :view do
  before(:each) do
    assign(:integration, Integration.new(
      name: "MyString",
      description: "MyText",
      type: ""
    ))
  end

  it "renders new integration form" do
    render

    assert_select "form[action=?][method=?]", integrations_path, "post" do

      assert_select "input[name=?]", "integration[name]"

      assert_select "textarea[name=?]", "integration[description]"

      assert_select "input[name=?]", "integration[type]"
    end
  end
end
