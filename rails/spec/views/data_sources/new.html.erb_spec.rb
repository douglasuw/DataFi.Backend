require 'rails_helper'

RSpec.describe "data_sources/new", type: :view do
  before(:each) do
    assign(:data_source, DataSource.new(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders new data_source form" do
    render

    assert_select "form[action=?][method=?]", data_sources_path, "post" do

      assert_select "input[name=?]", "data_source[name]"

      assert_select "textarea[name=?]", "data_source[description]"
    end
  end
end
