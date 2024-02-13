require 'rails_helper'

RSpec.describe "payment_methods/index", type: :view do
  before(:each) do
    assign(:payment_methods, [
      PaymentMethod.create!(
        name: "Name"
      ),
      PaymentMethod.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of payment_methods" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
