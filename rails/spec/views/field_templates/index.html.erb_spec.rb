require 'rails_helper'

RSpec.describe "field_templates/index", type: :view do
  before(:each) do
    assign(:field_templates, [
      FieldTemplate.create!(
        name: "Name",
        data: "",
        data_source: nil
      ),
      FieldTemplate.create!(
        name: "Name",
        data: "",
        data_source: nil
      )
    ])
  end

  it "renders a list of field_templates" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
