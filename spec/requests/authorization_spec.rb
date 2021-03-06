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

      describe "visiting the user index" do
        before { visit users_path }
        it { should have_title('Sign in') }
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

  describe "for non-signed-in users" do
    let(:user) { FactoryGirl.create(:user) }

    describe "when attempting to visit a protected page" do
      before do
        visit edit_user_path(user)
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      describe "after signing in" do
        it "should render the desired protected page" do
          expect(page).to have_content('Change')
        end
      end
    end

    describe "when attempting to comment on a blog post" do
      let(:post) { FactoryGirl.create(:post) }

      before do
        visit post_path(post)
        click_button "Sign in to add comment"
      end

      it "should show sign in page" do
        expect(page).to have_content("Sign in")
      end

      describe "after signing in" do
        before do
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        it "should render the post" do
          expect(page).to have_content(post.title)
        end
      end

    end
  end
end