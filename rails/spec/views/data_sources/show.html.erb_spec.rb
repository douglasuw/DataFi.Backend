require 'rails_helper'

RSpec.describe "data_sources/show", type: :view do
  before(:each) do
    assign(:data_source, DataSource.create!(
      name: "Name",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
