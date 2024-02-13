require 'rails_helper'

RSpec.describe "integrations/index", type: :view do
  before(:each) do
    assign(:integrations, [
      Integration.create!(
        name: "Name",
        description: "MyText",
        type: "Type"
      ),
      Integration.create!(
        name: "Name",
        description: "MyText",
        type: "Type"
      )
    ])
  end

  it "renders a list of integrations" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Type".to_s), count: 2
  end
end
