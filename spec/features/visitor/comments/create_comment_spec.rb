require "rails_helper"

feature "Create comment" do
  let!(:admin_user) { create :user, :administrator }
  let!(:site_page) { create :page, user: admin_user }

  context "as visitor i can't create comment" do
    scenario "hasn't link to create comment" do
      visit page_path(site_page)
      expect(page).not_to have_button("submit")
      expect(page).to have_content("You should sign in for have ability to add comments")
    end
  end
end
