require 'rails_helper'

RSpec.describe "integrations/edit", type: :view do
  let(:integration) {
    Integration.create!(
      name: "MyString",
      description: "MyText",
      type: ""
    )
  }

  before(:each) do
    assign(:integration, integration)
  end

  it "renders the edit integration form" do
    render

    assert_select "form[action=?][method=?]", integration_path(integration), "post" do

      assert_select "input[name=?]", "integration[name]"

      assert_select "textarea[name=?]", "integration[description]"

      assert_select "input[name=?]", "integration[type]"
    end
  end
end
