require 'rails_helper'

RSpec.describe "integrations/show", type: :view do
  before(:each) do
    assign(:integration, Integration.create!(
      name: "Name",
      description: "MyText",
      type: "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Type/)
  end
end
