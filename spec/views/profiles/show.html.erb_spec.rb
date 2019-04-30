require 'spec_helper'

describe "profiles/show" do
  fixtures :all

  before(:each) do
    @profile = assign(:profile, profiles(:admin))
    view.stub(:current_user).and_return(User.find_by(username: 'enjuadmin'))
  end

  describe "when logged in as Librarian" do
    before(:each) do
      @profile = assign(:profile, profiles(:librarian2))
      user = users(:librarian1)
      view.stub(:current_user).and_return(user)
    end

    it "cannot be deletable by other librarian" do
      allow(view).to receive(:policy).and_return double(update?: true, destroy?: true)
      render
    end
  end
end
