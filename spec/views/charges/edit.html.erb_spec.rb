require 'rails_helper'

RSpec.describe "charges/edit", type: :view do
  let(:charge) {
    Charge.create!(
      name: "MyString",
      amount: "9.99"
    )
  }

  before(:each) do
    assign(:charge, charge)
  end

  it "renders the edit charge form" do
    render

    assert_select "form[action=?][method=?]", charge_path(charge), "post" do

      assert_select "input[name=?]", "charge[name]"

      assert_select "input[name=?]", "charge[amount]"
    end
  end
end
