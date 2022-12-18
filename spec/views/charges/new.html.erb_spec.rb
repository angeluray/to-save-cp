require 'rails_helper'

RSpec.describe "charges/new", type: :view do
  before(:each) do
    assign(:charge, Charge.new(
      name: "MyString",
      amount: "9.99"
    ))
  end

  it "renders new charge form" do
    render

    assert_select "form[action=?][method=?]", charges_path, "post" do

      assert_select "input[name=?]", "charge[name]"

      assert_select "input[name=?]", "charge[amount]"
    end
  end
end
