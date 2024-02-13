require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  let(:team) {
    Team.create!(
      name: "MyString",
      size: 1,
      users: nil
    )
  }

  before(:each) do
    assign(:team, team)
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(team), "post" do

      assert_select "input[name=?]", "team[name]"

      assert_select "input[name=?]", "team[size]"

      assert_select "input[name=?]", "team[users_id]"
    end
  end
end
