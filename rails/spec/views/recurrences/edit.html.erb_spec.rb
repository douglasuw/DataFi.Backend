require 'rails_helper'

RSpec.describe "recurrences/edit", type: :view do
  let(:recurrence) {
    Recurrence.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:recurrence, recurrence)
  end

  it "renders the edit recurrence form" do
    render

    assert_select "form[action=?][method=?]", recurrence_path(recurrence), "post" do

      assert_select "input[name=?]", "recurrence[name]"
    end
  end
end
