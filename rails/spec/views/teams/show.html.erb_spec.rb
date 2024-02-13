require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    assign(:team, Team.create!(
      name: "Name",
      size: 2,
      users: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
