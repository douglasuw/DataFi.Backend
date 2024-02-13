require 'rails_helper'

RSpec.describe "plans/edit", type: :view do
  let(:plan) {
    Plan.create!(
      name: "MyString",
      title: "MyString",
      month_value: "9.99",
      year_value: "9.99",
      recommend: false,
      month_discount_percentual: 1,
      year_discount_percentual: 1,
      year_discount_value: "9.99",
      month_discount_value: "9.99"
    )
  }

  before(:each) do
    assign(:plan, plan)
  end

  it "renders the edit plan form" do
    render

    assert_select "form[action=?][method=?]", plan_path(plan), "post" do

      assert_select "input[name=?]", "plan[name]"

      assert_select "input[name=?]", "plan[title]"

      assert_select "input[name=?]", "plan[month_value]"

      assert_select "input[name=?]", "plan[year_value]"

      assert_select "input[name=?]", "plan[recommend]"

      assert_select "input[name=?]", "plan[month_discount_percentual]"

      assert_select "input[name=?]", "plan[year_discount_percentual]"

      assert_select "input[name=?]", "plan[year_discount_value]"

      assert_select "input[name=?]", "plan[month_discount_value]"
    end
  end
end
