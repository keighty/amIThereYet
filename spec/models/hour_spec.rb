require 'spec_helper'

describe Hour do

  before do
    @user = FactoryGirl.create(:user)
    @hour = @user.goals.first.hours.first
  end

  subject { @hour }

  it { should respond_to :duration }
  it { should respond_to :category }
  it { should respond_to :description }

  describe "with no duration" do
    before { @hour.duration = nil }
    it { should be_invalid }
  end
end
