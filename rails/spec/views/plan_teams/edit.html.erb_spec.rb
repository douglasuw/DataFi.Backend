require 'rails_helper'

RSpec.describe "plan_teams/edit", type: :view do
  let(:plan_team) {
    PlanTeam.create!(
      user: nil,
      plans: nil,
      payment_method: nil,
      active: false,
      value: "9.99"
    )
  }

  before(:each) do
    assign(:plan_team, plan_team)
  end

  it "renders the edit plan_team form" do
    render

    assert_select "form[action=?][method=?]", plan_team_path(plan_team), "post" do

      assert_select "input[name=?]", "plan_team[user_id]"

      assert_select "input[name=?]", "plan_team[plans_id]"

      assert_select "input[name=?]", "plan_team[payment_method_id]"

      assert_select "input[name=?]", "plan_team[active]"

      assert_select "input[name=?]", "plan_team[value]"
    end
  end
end
