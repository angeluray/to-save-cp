require 'rails_helper'

RSpec.describe "relations/new", type: :view do
  before(:each) do
    assign(:relation, Relation.new())
  end

  it "renders new relation form" do
    render

    assert_select "form[action=?][method=?]", relations_path, "post" do
    end
  end
end
