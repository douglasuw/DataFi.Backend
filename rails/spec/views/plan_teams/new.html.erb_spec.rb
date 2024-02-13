require 'rails_helper'

RSpec.describe "plan_teams/new", type: :view do
  before(:each) do
    assign(:plan_team, PlanTeam.new(
      user: nil,
      plans: nil,
      payment_method: nil,
      active: false,
      value: "9.99"
    ))
  end

  it "renders new plan_team form" do
    render

    assert_select "form[action=?][method=?]", plan_teams_path, "post" do

      assert_select "input[name=?]", "plan_team[user_id]"

      assert_select "input[name=?]", "plan_team[plans_id]"

      assert_select "input[name=?]", "plan_team[payment_method_id]"

      assert_select "input[name=?]", "plan_team[active]"

      assert_select "input[name=?]", "plan_team[value]"
    end
  end
end
