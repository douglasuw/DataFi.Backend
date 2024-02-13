require 'rails_helper'

RSpec.describe "email_templates/index", type: :view do
  before(:each) do
    assign(:email_templates, [
      EmailTemplate.create!(
        title: "Title",
        content: "MyText"
      ),
      EmailTemplate.create!(
        title: "Title",
        content: "MyText"
      )
    ])
  end

  it "renders a list of email_templates" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
