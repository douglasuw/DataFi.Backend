require 'rails_helper'

RSpec.describe "field_templates/edit", type: :view do
  let(:field_template) {
    FieldTemplate.create!(
      name: "MyString",
      data: "",
      data_source: nil
    )
  }

  before(:each) do
    assign(:field_template, field_template)
  end

  it "renders the edit field_template form" do
    render

    assert_select "form[action=?][method=?]", field_template_path(field_template), "post" do

      assert_select "input[name=?]", "field_template[name]"

      assert_select "input[name=?]", "field_template[data]"

      assert_select "input[name=?]", "field_template[data_source_id]"
    end
  end
end
