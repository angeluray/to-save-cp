require 'rails_helper'

RSpec.describe "charges/show", type: :view do
  before(:each) do
    assign(:charge, Charge.create!(
      name: "Name",
      amount: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
