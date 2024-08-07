require 'rails_helper'

RSpec.describe "teams/new", type: :view do
  before(:each) do
    assign(:team, Team.new(
      name: "MyString",
      size: 1,
      users: nil
    ))
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do

      assert_select "input[name=?]", "team[name]"

      assert_select "input[name=?]", "team[size]"

      assert_select "input[name=?]", "team[users_id]"
    end
  end
end
