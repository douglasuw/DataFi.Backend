require 'rails_helper'

RSpec.describe "project_users/edit", type: :view do
  let(:project_user) {
    ProjectUser.create!(
      project: nil,
      user: nil
    )
  }

  before(:each) do
    assign(:project_user, project_user)
  end

  it "renders the edit project_user form" do
    render

    assert_select "form[action=?][method=?]", project_user_path(project_user), "post" do

      assert_select "input[name=?]", "project_user[project_id]"

      assert_select "input[name=?]", "project_user[user_id]"
    end
  end
end
