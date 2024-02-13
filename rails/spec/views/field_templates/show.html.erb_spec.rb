require 'rails_helper'

RSpec.describe "field_templates/show", type: :view do
  before(:each) do
    assign(:field_template, FieldTemplate.create!(
      name: "Name",
      data: "",
      data_source: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
