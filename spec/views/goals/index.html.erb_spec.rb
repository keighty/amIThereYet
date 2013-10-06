require 'spec_helper'

describe "goals/index" do
  before(:each) do
    assign(:goals, [
      stub_model(Goal,
        :description => "Description",
        :motivation => "Motivation"
      ),
      stub_model(Goal,
        :description => "Description",
        :motivation => "Motivation"
      )
    ])
  end

  it "renders a list of goals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Motivation".to_s, :count => 2
  end
end
