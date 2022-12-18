require 'rails_helper'

RSpec.describe "relations/edit", type: :view do
  let(:relation) {
    Relation.create!()
  }

  before(:each) do
    assign(:relation, relation)
  end

  it "renders the edit relation form" do
    render

    assert_select "form[action=?][method=?]", relation_path(relation), "post" do
    end
  end
end
