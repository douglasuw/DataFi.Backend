require 'rails_helper'

RSpec.describe "plan_teams/show", type: :view do
  before(:each) do
    assign(:plan_team, PlanTeam.create!(
      user: nil,
      plans: nil,
      payment_method: nil,
      active: false,
      value: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/9.99/)
  end
end
