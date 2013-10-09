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

  describe "as wrong user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
    before { sign_in user, no_capybara: true }

    describe "submitting a GET request to the Users#edit action" do
      before { get edit_user_path(wrong_user) }
      specify { expect(response).to redirect_to(root_url) }
    end

    describe "submitting a PATCH request to the Users#update action" do
      before { patch user_path(wrong_user) }
      specify { expect(response).to redirect_to(root_url) }
    end
  end
end