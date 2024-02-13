require 'rails_helper'

RSpec.describe "recurrences/show", type: :view do
  before(:each) do
    assign(:recurrence, Recurrence.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
