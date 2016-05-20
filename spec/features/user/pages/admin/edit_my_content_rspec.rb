require "rails_helper"

feature "View page as administrator" do
  include_context "current user signed in"
  let!(:user) { current_user }
  let!(:category) { create :category }
  let!(:site_page) { create :page, user: user, category: category }
  let!(:comment) { create :comment, user: user }

  scenario "edit my page" do
    visit site_page_path(site_page)

    it "should have buttons for edit my page content" do
      expect(page).to have_link("Edit page")
      expect(page).to have_link("Delete")
    end

    it "should have link to Subscribe" do
      expect(page).to have_link("Subscribe")
    end
  end
end
