require 'rails_helper'

RSpec.describe "plan_teams/index", type: :view do
  before(:each) do
    assign(:plan_teams, [
      PlanTeam.create!(
        user: nil,
        plans: nil,
        payment_method: nil,
        active: false,
        value: "9.99"
      ),
      PlanTeam.create!(
        user: nil,
        plans: nil,
        payment_method: nil,
        active: false,
        value: "9.99"
      )
    ])
  end

  it "renders a list of plan_teams" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
