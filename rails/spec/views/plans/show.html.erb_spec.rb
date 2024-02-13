require 'rails_helper'

RSpec.describe "plans/show", type: :view do
  before(:each) do
    assign(:plan, Plan.create!(
      name: "Name",
      title: "Title",
      month_value: "9.99",
      year_value: "9.99",
      recommend: false,
      month_discount_percentual: 2,
      year_discount_percentual: 3,
      year_discount_value: "9.99",
      month_discount_value: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
