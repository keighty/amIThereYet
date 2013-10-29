require 'spec_helper'

describe "Goal Hours" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content("Goals") }

    it "should list user goals" do
      expect(page).to have_content(user.goals.first.description)
    end

    it "should list user hours" do
      expect(page).to have_content("Total hours")
    end
  end
end