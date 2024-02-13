require 'rails_helper'

RSpec.describe "field_templates/new", type: :view do
  before(:each) do
    assign(:field_template, FieldTemplate.new(
      name: "MyString",
      data: "",
      data_source: nil
    ))
  end

  it "renders new field_template form" do
    render

    assert_select "form[action=?][method=?]", field_templates_path, "post" do

      assert_select "input[name=?]", "field_template[name]"

      assert_select "input[name=?]", "field_template[data]"

      assert_select "input[name=?]", "field_template[data_source_id]"
    end
  end
end
