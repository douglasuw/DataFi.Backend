require 'rails_helper'

RSpec.describe "project_users/index", type: :view do
  before(:each) do
    assign(:project_users, [
      ProjectUser.create!(
        project: nil,
        user: nil
      ),
      ProjectUser.create!(
        project: nil,
        user: nil
      )
    ])
  end

  it "renders a list of project_users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
