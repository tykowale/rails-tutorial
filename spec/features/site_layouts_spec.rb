require "rails_helper"

RSpec.describe "Home Page", type: :feature do
  describe "layout links" do
    it "has the correct links" do
      visit root_path
      expect(page).to have_link(href: root_path, count: 2)
      expect(page).to have_link(href: help_path)
      expect(page).to have_link(href: about_path)
      expect(page).to have_link(href: contact_path)
    end
  end
end
