require 'rails_helper'

RSpec.describe "fields/new", type: :view do
  before(:each) do
    assign(:field, Field.new(
      name: "MyString",
      data: ""
    ))
  end

  it "renders new field form" do
    render

    assert_select "form[action=?][method=?]", fields_path, "post" do

      assert_select "input[name=?]", "field[name]"

      assert_select "input[name=?]", "field[data]"
    end
  end
end