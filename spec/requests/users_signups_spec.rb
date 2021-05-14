require "rails_helper"

RSpec.describe "UsersSignups", type: :feature do
  let(:submit) { find(:css, 'input[type="submit"]') }

  describe "signup form" do
    it "doesn't save invalid user" do
      visit signup_path
      before_count = User.count

      page.fill_in "user_name", with: ""
      page.fill_in "user_email", with: "user@invalid"
      submit.click

      after_count = User.count
      expect(before_count).to eq(after_count)
      expect(find(:css, "div#error_explanation")).not_to be_nil
    end

    it "saves valid users" do
      visit signup_path
      before_count = User.count

      page.fill_in "user_name", with: "Ty"
      page.fill_in "user_email", with: "user@example.com"
      page.fill_in "user_password", with: "password"
      page.fill_in "user_password_confirmation", with: "password"
      submit.click

      after_count = User.count
      expect(before_count + 1).to eq(after_count)
      expect(find(:css, ".alert-success")).not_to be_nil
    end
  end
end
