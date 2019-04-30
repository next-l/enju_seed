require 'rails_helper'

RSpec.describe "roles/show", type: :view do
  fixtures :roles
  before(:each) do
    @role = assign(:role, Role.find_by(name: 'User'))
  end

  it "renders attributes in <p>" do
    allow(view).to receive(:policy).and_return double(update?: true, destroy?: true)
    render
    expect(rendered).to match(/User/)
  end
end
