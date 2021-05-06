require "rails_helper"

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(
      name: "Example User",
      email: "user@example.com",
      password: "foobar",
      password_confirmation: "foobar"
    )
  end

  it "is a valid user" do
    expect(@user).to be_valid
  end

  describe "name" do
    it "is not valid when a name is not present" do
      @user.name = "      "
      expect(@user).not_to be_valid
    end

    it "is not valid when a name is over 50 characters long" do
      @user.name = "a" * 51
      expect(@user).not_to be_valid
    end
  end

  describe "email" do
    it "is not valid when an email is not present" do
      @user.email = ""
      expect(@user).not_to be_valid
    end

    it "is not valid when an email is over 255 characters" do
      @user.email = "#{'a' * 244}@example.com"
      expect(@user).not_to be_valid
    end

    it "rejects invalid emails" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
      end
    end

    it "requires each email to be unique" do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user).not_to be_valid
    end

    it "saves emails as lower case" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      @user.email = mixed_case_email
      @user.save
      expect(mixed_case_email.downcase).to eql @user.reload.email
    end
  end

  describe "passwords" do
    it "requires passwords to not be blank" do
      @user.password = " " * 6
      @user.password_confirmation = " " * 6
      expect(@user).not_to be_valid
    end

    it "requires passwords to be at least 6 characters" do
      @user.password = "a" * 5
      @user.password_confirmation = "a" * 5
      expect(@user).not_to be_valid
    end
  end
end
