require "rails_helper"

RSpec.describe "StaticPages", type: :feature do
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET /" do
    it "has the correct title" do
      visit root_path
      expect(page).to have_title(@base_title)
    end
  end

  describe "GET /help" do
    it "has the correct title" do
      visit help_path
      expect(page).to have_title("Help | #{@base_title}")
    end
  end

  describe "GET /about" do
    it "has the correct title" do
      visit about_path
      expect(page).to have_title("About | #{@base_title}")
    end
  end

  describe "GET /contact" do
    it "has the correct title" do
      visit contact_path
      expect(page).to have_title("Contact | #{@base_title}")
    end
  end
end
