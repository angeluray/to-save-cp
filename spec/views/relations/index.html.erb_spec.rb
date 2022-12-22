require 'rails_helper'

RSpec.describe "relations/index", type: :view do
  before(:each) do
    assign(:relations, [
      Relation.create!(),
      Relation.create!()
    ])
  end

  it "renders a list of relations" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
