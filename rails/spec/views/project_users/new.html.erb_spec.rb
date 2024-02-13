require 'rails_helper'

RSpec.describe "project_users/new", type: :view do
  before(:each) do
    assign(:project_user, ProjectUser.new(
      project: nil,
      user: nil
    ))
  end

  it "renders new project_user form" do
    render

    assert_select "form[action=?][method=?]", project_users_path, "post" do

      assert_select "input[name=?]", "project_user[project_id]"

      assert_select "input[name=?]", "project_user[user_id]"
    end
  end
end
