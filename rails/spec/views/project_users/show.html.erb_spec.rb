require 'rails_helper'

RSpec.describe "project_users/show", type: :view do
  before(:each) do
    assign(:project_user, ProjectUser.create!(
      project: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
