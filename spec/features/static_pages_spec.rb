require "rails_helper"

RSpec.describe "StaticPages", type: :feature do
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET /home" do
    it "has the correct title" do
      visit static_pages_home_url
      expect(page).to have_title("Home | #{@base_title}")
    end
  end

  describe "GET /help" do
    it "has the correct title" do
      visit static_pages_help_url
      expect(page).to have_title("Help | #{@base_title}")
    end
  end

  describe "GET /about" do
    it "has the correct title" do
      visit static_pages_about_url
      expect(page).to have_title("About | #{@base_title}")
    end
  end
end
