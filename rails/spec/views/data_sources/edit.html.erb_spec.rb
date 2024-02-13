require 'rails_helper'

RSpec.describe "data_sources/edit", type: :view do
  let(:data_source) {
    DataSource.create!(
      name: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:data_source, data_source)
  end

  it "renders the edit data_source form" do
    render

    assert_select "form[action=?][method=?]", data_source_path(data_source), "post" do

      assert_select "input[name=?]", "data_source[name]"

      assert_select "textarea[name=?]", "data_source[description]"
    end
  end
end
