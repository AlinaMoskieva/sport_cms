require "rails_helper"

feature "Create page" do
  context "as visitor" do
    background do
      visit root_path
    end

    it "hasn't link to create new page" do
      expect(page).not_to have_link("New page")
    end
  end
end
