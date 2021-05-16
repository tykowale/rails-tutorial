require "rails_helper"

RSpec.describe "UserLogin", type: :request do

  before(:all) do
    @user = build :user
    @user.save(validate: false)
  end

  after(:all) do
    @user.destroy!
  end

  def is_logged_in?
    !session[:user_id].nil?
  end

  describe "POST /login" do
    it "logs user in with valid credentials" do
      post login_path, params: { session: { email: @user.email, password: "password" } }

      expect(response).to redirect_to(@user)
      expect(is_logged_in?).to be_truthy
    end

    it "does not log in a user with invalid credentials" do
      post login_path, params: { session: { email: @user.email, password: "" } }

      expect(response).not_to redirect_to(@user)
      expect(is_logged_in?).to be_falsey
    end
  end
end
