require 'rails_helper'

RSpec.describe "roles/index", type: :view do
  fixtures :roles
  before(:each) do
    assign(:roles, Role.all)
  end

  it "renders a list of roles" do
    allow(view).to receive(:policy).and_return double(update?: true, destroy?: true)
    render
    assert_select "tr>td", text: "Librarian".to_s, count: 2
  end
end
