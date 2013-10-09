require 'spec_helper'

describe "Authorization" do
  subject { page }

  describe "for non-signed-in users" do
    let(:user) { FactoryGirl.create(:user) }

    describe "in the Users controller" do

      describe "visiting the edit page" do
        before { visit edit_user_path(user) }
        it { should have_content('Sign in') }
      end

      describe "submitting to the update action" do
        before { patch user_path(user) }
        specify { expect(response).to redirect_to(signin_path) }
      end
    end
  end
end