require 'rails_helper'

RSpec.describe "payment_methods/edit", type: :view do
  let(:payment_method) {
    PaymentMethod.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:payment_method, payment_method)
  end

  it "renders the edit payment_method form" do
    render

    assert_select "form[action=?][method=?]", payment_method_path(payment_method), "post" do

      assert_select "input[name=?]", "payment_method[name]"
    end
  end
end
